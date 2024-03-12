
  create or replace   view DBT_VOTER_DATA.cleaned.missouri_voters
  
   as (
    SELECT DISTINCT '2023-10-10'::date                       as FILE_DATE,
                'MO'                                     as STATE_CODE,
                REPLACE(
                        REPLACE(
                                REPLACE(COUNTY, 'St.', 'St'),
                                'De Kalb',
                                'DeKalb'),
                        'Kansas City',
                        'Jackson')                       as COUNTY_CODE,
                VOTER_ID                                 AS VOTER_ID,
                NUll                                     AS PREFIX,
                FIRST_NAME                               AS FIRST_NAME,
                MIDDLE_NAME                              AS MIDDLE_NAME,
                LAST_NAME                                AS LAST_NAME,
                SUFFIX                                   AS NAME_SUFFIX,
                COALESCE(PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    HOUSE_NUMBER,
                    HOUSE_SUFFIX,
                    PRE_DIRECTION,
                    STREET_NAME,
                    STREET_TYPE,
                    POST_DIRECTION
                    ]),
                         NON_STANDARD_ADDRESS)           AS RESIDENCE_ADDRESS_LINE_1,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    UNIT_TYPE,
                    UNIT_NUMBER
                    ])                                   AS RESIDENCE_ADDRESS_LINE_2,
                RESIDENTIAL_CITY                         AS RESIDENCE_ADDRESS_CITY,
                COALESCE(RESIDENTIAL_STATE, 'MO')        AS RESIDENCE_ADDRESS_STATE,
                RESIDENTIAL_ZIP_CODE                     AS RESIDENCE_ADDRESS_ZIPCODE,
                'USA'                                    AS RESIDENCE_ADDRESS_COUNTRY,
                BIRTHDATE                                AS BIRTH_YEAR,
                NULL                                     AS BIRTH_MONTH,
                NULL                                     AS BIRTH_DATE,
                CASE
                    WHEN VOTER_STATUS = 'Active' THEN 'A'
                    WHEN VOTER_STATUS = 'Inactive'
                        THEN 'I' END                     as VOTER_STATUS,
                TO_DATE(REGISTRATION_DATE, 'MM/DD/YYYY') AS REGISTRATION_DATE,
                NULL                                     AS LAST_VOTED_DATE,
                POLITICAL_PARTY                          AS LAST_PARTY_VOTED,
                CONGRESSIONAL_DISTRICT_20                AS CONGRESSIONAL_DISTRICT,
                SENATE_DISTRICT_20                       AS STATE_SENATE_DISTRICT,
                LEGISLATIVE_DISTRICT_20                  AS STATE_HOUSE_DISTRICT,
                NULL                                     AS JUDICIAL_DISTRICT,
                NULL                                     AS COUNTY_COMMISSION_DISTRICT,
                NULL                                     AS SCHOOL_BOARD_DISTRICT,
                NULL                                     AS CITY_COUNCIL_DISTRICT,
                PRECINCT_NAME                            AS COUNTY_PRECINCT,
                NULL                                     AS MUNICIPAL_PRECINCT,
                NULL                                     AS RACE,
                NULL                                     AS GENDER,
                MAILING_ADDRESS                          AS MAILING_ADDRESS_LINE_1,
                NULL                                     AS MAILING_ADDRESS_LINE_2,
                NULL                                     AS MAILING_LINE_3,
                MAILING_CITY                             AS MAILING_CITY,
                MAILING_STATE                            AS MAILING_STATE,
                MAILING_ZIP_CODE                         AS MAILING_ZIPCODE,
                NULL                                     AS MAILING_COUNTRY
FROM RAW.MISSOURI_VOTERS_2023_10_10
  );
