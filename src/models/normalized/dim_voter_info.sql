{{
    config(
        materialized='incremental',
        on_schema_change='sync_all_columns',
        unique_keys='SK_VOTER_INFO_ID'
    )
}}

SELECT V.SK_VOTER_INFO_ID,
       V.STATE_CODE,
       V.COUNTY_CODE,
       V.PREFIX              AS NAME_PREFIX,
       V.FIRST_NAME,
       V.MIDDLE_NAME,
       V.LAST_NAME,
       V.NAME_SUFFIX,
       V.VOTER_STATUS,
       V.REGISTRATION_DATE,
       NCOA.MOVE_DATE        AS MOVE_DATE,
       MAX(VH.ELECTION_DATE) AS LAST_VOTE_DATE,
       V.LAST_PARTY_VOTED,
       V.CREATED_AT          AS CREATED_AT
FROM {{ ref("all_voters") }} V
         LEFT JOIN {{ ref("all_voter_history") }} VH
                   ON V.STATE_CODE = VH.STATE_CODE AND
                      V.COUNTY_CODE = VH.COUNTY_CODE AND
                      V.VOTER_ID = VH.VOTER_ID
         LEFT JOIN {{ ref("all_voters_ncoa") }} NCOA
                   ON V.STATE_CODE = NCOA.INPUT_STATE AND
                      V.COUNTY_CODE = NCOA.INPUT_COUNTY AND
                      V.VOTER_ID = NCOA.INPUT_VOTER_ID AND
                      NCOA.RECORD_TYPE = 'C'
    {% if is_incremental() %}
WHERE NOT EXISTS (SELECT 1 FROM {{ this }} dim_v_info WHERE dim_v_info.SK_VOTER_INFO_ID = V.SK_VOTER_INFO_ID)
    {% endif %}
GROUP BY V.SK_VOTER_INFO_ID, V.PREFIX, V.FIRST_NAME, V.MIDDLE_NAME, V.LAST_NAME, V.NAME_SUFFIX, V.VOTER_STATUS,
         V.REGISTRATION_DATE, NCOA.MOVE_DATE, V.LAST_PARTY_VOTED, V.STATE_CODE, V.COUNTY_CODE, V.LAST_PARTY_VOTED,
         V.CREATED_AT
QUALIFY ROW_NUMBER() OVER (PARTITION BY V.SK_VOTER_INFO_ID ORDER BY V.SK_VOTER_INFO_ID) = 1