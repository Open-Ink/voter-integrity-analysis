

WITH ADDRESSES AS (SELECT V.STATE_CODE                                              AS SOURCE_STATE,
                          COALESCE(NCOA.ADDRESS_LINE_1, V.RESIDENCE_ADDRESS_LINE_1) AS LINE_1,
                          COALESCE(NCOA.ADDRESS_LINE_2, V.RESIDENCE_ADDRESS_LINE_2) AS LINE_2,
                          V.RESIDENCE_ADDRESS_CITY                                  AS CITY,
                          V.RESIDENCE_ADDRESS_STATE                                 AS STATE,
                          V.RESIDENCE_ADDRESS_ZIPCODE                               AS ZIPCODE,
                          RESIDENCE_ADDRESS_COUNTRY                                 as COUNTRY,
                          'RESIDENCE'                                               AS ADDRESS_TYPE,
                          V.CREATED_AT                                              AS CREATED_AT
                   FROM DBT_VOTER_DATA.cleaned.all_voters V
                            LEFT JOIN DBT_VOTER_DATA.cleaned.all_voters_ncoa NCOA
                                      ON V.STATE_CODE = NCOA.INPUT_STATE
                                          AND V.COUNTY_CODE = NCOA.INPUT_COUNTY
                                          AND V.VOTER_ID = NCOA.INPUT_VOTER_ID
                                          AND V.FILE_DATE = NCOA.INPUT_FILE_DATE
                                          AND NCOA.RECORD_TYPE IN ('A', 'H')),
     ADDRESS_WITH_ID
         AS (SELECT PUBLIC.CREATE_ADDRESS_HASH(LINE_1, LINE_2, CITY, STATE, ZIPCODE) AS SK_ADDRESS_ID,
                    LINE_1,
                    LINE_2,
                    CITY,
                    STATE,
                    ZIPCODE,
                    COUNTRY,
                    ADDRESS_TYPE,
                    SOURCE_STATE,
                    CREATED_AT
             FROM ADDRESSES
             QUALIFY ROW_NUMBER() OVER (PARTITION BY SK_ADDRESS_ID ORDER BY SK_ADDRESS_ID) = 1)
SELECT SK_ADDRESS_ID,
       SOURCE_STATE,
       LINE_1,
       LINE_2,
       CITY,
       STATE,
       ZIPCODE,
       COUNTRY,
       ADDRESS_TYPE,
       CREATED_AT
FROM ADDRESS_WITH_ID
    
WHERE NOT EXISTS (SELECT 1 FROM DBT_VOTER_DATA.normalized.dim_address this2 WHERE ADDRESS_WITH_ID.SK_ADDRESS_ID = this2.SK_ADDRESS_ID)
