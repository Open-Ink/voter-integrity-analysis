
  create or replace   view DBT_VOTER_DATA.cleaned.kansas_voters
  
   as (
    SELECT DISTINCT '2023-11-06'::date                                      as FILE_DATE,
                'KS'                                                    as STATE_CODE,
                VOTERS.DB_LOGID                                         as COUNTY_CODE,
                VOTERS.TEXT_REGISTRANT_ID                               AS VOTER_ID,
                CDE_NAME_TITLE                                          AS PREFIX,
                VOTERS.TEXT_NAME_FIRST                                  AS FIRST_NAME,
                VOTERS.TEXT_NAME_MIDDLE                                 AS MIDDLE_NAME,
                VOTERS.TEXT_NAME_LAST                                   AS LAST_NAME,
                VOTERS.CDE_NAME_SUFFIX                                  AS NAME_SUFFIX,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    TEXT_RES_ADDRESS_NBR,
                    TEXT_RES_ADDRESS_NBR_SUFFIX,
                    CDE_STREET_DIR_PREFIX,
                    TEXT_STREET_NAME,
                    CDE_STREET_TYPE,
                    CDE_STREET_DIR_SUFFIX])                             AS RESIDENCE_ADDRESS_LINE_1,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    CDE_RES_UNIT_TYPE,
                    TEXT_RES_UNIT_NBR
                    ])                                                  AS RESIDENCE_ADDRESS_LINE_2,
                TEXT_RES_CITY                                           AS RESIDENCE_ADDRESS_CITY,
                COALESCE(CDE_RES_STATE, 'KS')                           AS RESIDENCE_ADDRESS_STATE,
                VOTERS.TEXT_RES_ZIP5                                    AS RESIDENCE_ADDRESS_ZIPCODE,
                'USA'                                                   AS RESIDENCE_ADDRESS_COUNTRY,
                YEAR(TO_DATE(VOTERS.DATE_OF_BIRTH, 'MM/DD/YYYY'))       AS BIRTH_YEAR,
                MONTH(TO_DATE(VOTERS.DATE_OF_BIRTH, 'MM/DD/YYYY'))      AS BIRTH_MONTH,
                DAYOFMONTH(TO_DATE(VOTERS.DATE_OF_BIRTH, 'MM/DD/YYYY')) AS BIRTH_DATE,
                CDE_REGISTRANT_STATUS                                   as VOTER_STATUS,
                TO_DATE(VOTERS.DATE_OF_REGISTRATION, 'MM/DD/YYYY')      AS REGISTRATION_DATE,
                NULL                                                    AS LAST_VOTED_DATE,
                DESC_PARTY                                              AS LAST_PARTY_VOTED,
                VOTERS.DISTRICT_CG                                      AS CONGRESSIONAL_DISTRICT,
                VOTERS.DISTRICT_KS                                      AS STATE_SENATE_DISTRICT,
                VOTERS.DISTRICT_KR                                      AS STATE_HOUSE_DISTRICT,
                VOTERS.DISTRICT_JD                                      AS JUDICIAL_DISTRICT,
                NULL                                                    AS COUNTY_COMMISSION_DISTRICT,
                VOTERS.DISTRICT_SB                                      AS SCHOOL_BOARD_DISTRICT,
                NULL                                                    AS CITY_COUNCIL_DISTRICT,
                VOTERS.PRECINCT_TEXT_NAME                               AS COUNTY_PRECINCT,
                NULL                                                    AS MUNICIPAL_PRECINCT,
                NULL                                                    AS RACE,
                CASE
                    WHEN VOTERS.CDE_GENDER = 'M' THEN 'M'
                    WHEN VOTERS.CDE_GENDER = 'F' THEN 'F'
                    WHEN VOTERS.CDE_GENDER = 'U' THEN 'U'
                    ELSE 'U' END                                        AS GENDER,
                TEXT_MAIL_ADDRESS1                                      AS MAILING_ADDRESS_LINE_1,
                TEXT_MAIL_ADDRESS2                                      AS MAILING_ADDRESS_LINE_2,
                TEXT_MAIL_ADDRESS3                                      AS MAILING_LINE_3,
                VOTERS.TEXT_MAIL_CITY                                   AS MAILING_CITY,
                VOTERS.CDE_MAIL_STATE                                   AS MAILING_STATE,
                VOTERS.TEXT_MAIL_ZIP5                                   AS MAILING_ZIPCODE,
                VOTERS.TEXT_MAIL_ADDRESS4                               AS MAILING_COUNTRY
FROM RAW.KANSAS_VOTERS_2023_11_06 VOTERS
WHERE TRY_TO_DATE(DATE_OF_BIRTH) IS NOT NULL
  );

