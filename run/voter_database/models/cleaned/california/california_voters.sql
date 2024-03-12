
  create or replace   view DBT_VOTER_DATA.cleaned.california_voters
  
   as (
    SELECT DISTINCT '2024-02-05'::date                       as FILE_DATE,
                'CA'                                     as STATE_CODE,
                C.COUNTY_NAME                            as COUNTY_CODE,
                REGISTRANT_ID                            AS VOTER_ID,
                NAME_PREFIX                              AS PREFIX,
                FIRST_NAME                               AS FIRST_NAME,
                MIDDLE_NAME                              AS MIDDLE_NAME,
                LAST_NAME                                AS LAST_NAME,
                SUFFIX                                   AS NAME_SUFFIX,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    ADDRESS_NUMBER,
                    HOUSE_FRACTION_NUMBER,
                    ADDRESS_NUMBER_SUFFIX,
                    STREET_DIR_PREFIX,
                    STREET_NAME,
                    STREET_TYPE,
                    STREET_DIR_SUFFIX
                    ])                                   AS RESIDENCE_ADDRESS_LINE_1,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    UNIT_TYPE,
                    UNIT_NUMBER
                    ])                                   AS RESIDENCE_ADDRESS_LINE_2,
                CITY                                     AS RESIDENCE_ADDRESS_CITY,
                COALESCE(STATE, 'CA')                    AS RESIDENCE_ADDRESS_STATE,
                ZIP                                      AS RESIDENCE_ADDRESS_ZIPCODE,
                'USA'                                    AS RESIDENCE_ADDRESS_COUNTRY,
                YEAR(TO_DATE(DOB, 'YYYY-MM-DD'))         AS BIRTH_YEAR,
                MONTH(TO_DATE(DOB, 'YYYY-MM-DD'))        AS BIRTH_MONTH,
                DAYOFMONTH(TO_DATE(DOB, 'YYYY-MM-DD'))   AS BIRTH_DATE,
                STATUS                                   as VOTER_STATUS,
                TO_DATE(REGISTRATION_DATE, 'YYYY-MM-DD') AS REGISTRATION_DATE,
                NULL                                     AS LAST_VOTED_DATE,
                PARTY_CODE                               AS LAST_PARTY_VOTED,
                NULL                                     AS CONGRESSIONAL_DISTRICT,
                NULL                                     AS STATE_SENATE_DISTRICT,
                NULL                                     AS STATE_HOUSE_DISTRICT,
                NULL                                     AS JUDICIAL_DISTRICT,
                NULL                                     AS COUNTY_COMMISSION_DISTRICT,
                NULL                                     AS SCHOOL_BOARD_DISTRICT,
                NULL                                     AS CITY_COUNCIL_DISTRICT,
                PRECINCT                                 AS COUNTY_PRECINCT,
                NULL                                     AS MUNICIPAL_PRECINCT,
                NULL                                     AS RACE,
                GENDER                                   AS GENDER,
                MAILING_ADDRESS_LINE1                    AS MAILING_ADDRESS_LINE_1,
                MAILING_ADDRESS_LINE2                    AS MAILING_ADDRESS_LINE_2,
                MAILING_ADDRESS_LINE3                    AS MAILING_LINE_3,
                MAILING_CITY                             AS MAILING_CITY,
                MAILING_STATE                            AS MAILING_STATE,
                MAILING_ZIP5                             AS MAILING_ZIPCODE,
                MAILING_COUNTRY                          AS MAILING_COUNTRY
FROM RAW.CALIFORNIA_VOTERS_2024_02_05 V
         INNER JOIN DBT_VOTER_DATA.cleaned.california_counties C
                    ON V.COUNTY_CODE = C.COUNTY_CODE
  );

