{{
    config(
        materialized='incremental',
        on_schema_change='sync_all_columns'
 )
}}

WITH ADDRESSES AS (SELECT V.SK_VOTER_INFO_ID,
                          COALESCE(NCOA.ADDRESS_LINE_1, V.RESIDENCE_ADDRESS_LINE_1) AS LINE_1,
                          COALESCE(NCOA.ADDRESS_LINE_2, V.RESIDENCE_ADDRESS_LINE_2) AS LINE_2,
                          V.RESIDENCE_ADDRESS_CITY                                  AS CITY,
                          V.RESIDENCE_ADDRESS_STATE                                 AS STATE,
                          V.RESIDENCE_ADDRESS_ZIPCODE                               AS ZIPCODE
                   FROM {{ ref('all_voters') }} V
                            LEFT JOIN {{ ref('all_voters_ncoa') }} NCOA
                                      ON V.STATE_CODE = NCOA.INPUT_STATE
                                          AND V.COUNTY_CODE = NCOA.INPUT_COUNTY
                                          AND V.VOTER_ID = NCOA.INPUT_VOTER_ID
                                          AND V.FILE_DATE = NCOA.INPUT_FILE_DATE
                                          AND NCOA.RECORD_TYPE IN ('A', 'H')),
     ADDRESS_WITH_ID
         AS (SELECT SK_VOTER_INFO_ID,
                    {{target.schema}}.CREATE_ADDRESS_HASH(
                            LINE_1,
                            LINE_2,
                            CITY,
                            STATE,
                            ZIPCODE) AS SK_ADDRESS_ID
             FROM ADDRESSES)

SELECT DISTINCT V.STATE_CODE,
                COUNTY.COUNTY_ID,
                V.VOTER_ID,
                ADD.SK_ADDRESS_ID                                       AS SK_ADDRESS_ID,
                V.SK_VOTER_INFO_ID,
                1                                                       AS COUNT,
                V.CONGRESSIONAL_DISTRICT                                AS CONGRESSIONAL_DISTRICT,
                IFF(NCOA.MOVE_DATE IS NOT NULL, 1, 0)::int              AS DID_MOVE,
                IFF(NCOA.INPUT_STATE != NCOA.STATE_CODE, 1, 0) ::int    AS DID_MOVE_TO_ANOTHER_STATE,
                IFF(NCOA.INPUT_STATE = NCOA.STATE_CODE
                        AND NCOA.COUNTY_FIPS != COUNTY.COUNTYFP
                    , 1, 0) ::int                                       AS DID_MOVE_TO_ANOTHER_COUNTY,
                IFF(NCOA.MOVE_DATE > MAX(VH.ELECTION_DATE), 1, 0) ::int AS DID_VOTE_AFTER_MOVING,
                IFF(ADD_INFO.ADDRESS_STATUS = 'N', 1, 0) ::int          AS IS_ADDRESS_INVALID,
                IFF(ADD_INFO.VACANT = 'Y', 1, 0) ::int                  AS IS_ADDRESS_VACANT,
                CASE
                    WHEN ADD_INFO.RESIDENTIAL_DELIVERY_INDICATOR = 'N'
                        THEN 1
                    ELSE 0 END                                          AS IS_ADDRESS_COMMERCIAL,
                CASE
                    WHEN MAX(VH.ELECTION_DATE) > dateadd(year, -2, current_date) AND V.VOTER_STATUS = 'I' THEN 1::int
                    ELSE 0::int
                    END                                                 AS IS_INACTIVE_AND_VOTED,
                V.CREATED_AT                                            AS CREATED_AT
FROM {{ ref("all_voters") }} V
         LEFT JOIN ADDRESS_WITH_ID ADD ON ADD.SK_VOTER_INFO_ID = V.SK_VOTER_INFO_ID
         LEFT JOIN {{ ref("all_voter_history") }} vh
                   ON V.STATE_CODE = VH.STATE_CODE AND
                      V.COUNTY_CODE = VH.COUNTY_CODE AND
                      V.VOTER_ID = VH.VOTER_ID
         LEFT JOIN {{ ref("all_voters_ncoa") }} NCOA
                   ON V.STATE_CODE = NCOA.INPUT_STATE AND
                      V.COUNTY_CODE = NCOA.INPUT_COUNTY AND
                      V.VOTER_ID = NCOA.INPUT_VOTER_ID
                       AND NCOA.RECORD_TYPE = 'C'
         LEFT JOIN {{ ref("all_voters_ncoa") }} ADD_INFO
                   ON V.STATE_CODE = ADD_INFO.INPUT_STATE AND
                      V.COUNTY_CODE = ADD_INFO.INPUT_COUNTY AND
                      V.VOTER_ID = ADD_INFO.INPUT_VOTER_ID AND
                      ADD_INFO.RECORD_TYPE in ('A', 'H')
         LEFT JOIN {{ ref("dim_county") }} COUNTY
                   ON V.STATE_CODE = COUNTY.STATE_CODE AND
                      V.COUNTY_CODE = COUNTY.COUNTY_CODE
    {% if is_incremental() %}
WHERE NOT EXISTS (SELECT 1 FROM {{ this }} this WHERE this.SK_VOTER_INFO_ID = V.SK_VOTER_INFO_ID)
    {% endif %}
GROUP BY V.STATE_CODE,
         COUNTY.COUNTY_ID,
         COUNTY.COUNTYFP,
         V.VOTER_ID,
         V.SK_VOTER_INFO_ID,
         NCOA.MOVE_DATE,
         NCOA.INPUT_STATE,
         NCOA.COUNTY_FIPS,
         NCOA.STATE_CODE,
         NCOA.COUNTY_NAME,
         NCOA.INPUT_COUNTY,
         V.VOTER_STATUS,
         ADD_INFO.ADDRESS_STATUS,
         ADD_INFO.VACANT,
         ADD.SK_ADDRESS_ID,
         ADD_INFO.RESIDENTIAL_DELIVERY_INDICATOR,
         V.CONGRESSIONAL_DISTRICT,
         V.CREATED_AT