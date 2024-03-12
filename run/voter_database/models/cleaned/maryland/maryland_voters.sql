
  create or replace   view DBT_VOTER_DATA.cleaned.maryland_voters
  
   as (
    SELECT DISTINCT '2023-12-05'::date                                     as FILE_DATE,
                'MD'                                                   as STATE_CODE,
                REPLACE(REPLACE(COUNTY, ' County', ''), 'Saint ', 'St ') as COUNTY_CODE,
                VTR_ID                                                 AS VOTER_ID,
                NULL                                                   AS PREFIX,
                FIRST_NAME                                             AS FIRST_NAME,
                MIDDLE_NAME                                            AS MIDDLE_NAME,
                LAST_NAME                                              AS LAST_NAME,
                SUFFIX                                                 AS NAME_SUFFIX,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    HOUSE_NUMBER,
                    HOUSE_SUFFIX,
                    STREET_PRE_DIRECTION,
                    STREET_NAME,
                    STREET_TYPE,
                    STREET_POST_DIRECTION
                    ])                                                 AS RESIDENCE_ADDRESS_LINE_1,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    UNIT_TYPE,
                    UNIT_NUMBER
                    ])                                                 AS RESIDENCE_ADDRESS_LINE_2,
                RESIDENTIAL_CITY                                       AS RESIDENCE_ADDRESS_CITY,
                RESIDENTIAL_STATE                                      AS RESIDENCE_ADDRESS_STATE,
                RESIDENTIAL_ZIP5                                       AS RESIDENCE_ADDRESS_ZIPCODE,
                'USA'                                                  AS RESIDENCE_ADDRESS_COUNTRY,
                NULL                                                   AS BIRTH_YEAR,
                NULL                                                   AS BIRTH_MONTH,
                NULL                                                   AS BIRTH_DATE,
                STATUS_CODE                                            as VOTER_STATUS,
                TO_DATE(STATE_REGISTRATION_DATE, 'MM-DD-YYYY')         AS REGISTRATION_DATE,
                NULL                                                   AS LAST_VOTED_DATE,
                PARTY                                                  AS LAST_PARTY_VOTED,
                CONGRESSIONAL_DISTRICTS                                AS CONGRESSIONAL_DISTRICT,
                NULL                                                   AS STATE_SENATE_DISTRICT,
                LEGISLATIVE_DISTRICTS                                  AS STATE_HOUSE_DISTRICT,
                NULL                                                   AS JUDICIAL_DISTRICT,
                COMMISSIONER_DISTRICTS                                 AS COUNTY_COMMISSION_DISTRICT,
                SCHOOL_DISTRICTS                                       AS SCHOOL_BOARD_DISTRICT,
                NULL                                                   AS CITY_COUNCIL_DISTRICT,
                PRECINCT                                               AS COUNTY_PRECINCT,
                NULL                                                   AS MUNICIPAL_PRECINCT,
                NULL                                                   AS RACE,
                GENDER                                                 AS GENDER,
                MAILING_ADDRESS                                        AS MAILING_ADDRESS_LINE_1,
                NULL                                                   AS MAILING_ADDRESS_LINE_2,
                NULL                                                   AS MAILING_LINE_3,
                MAILING_CITY                                           AS MAILING_CITY,
                MAILING_STATE                                          AS MAILING_STATE,
                MAILING_ZIP5                                           AS MAILING_ZIPCODE,
                COUNTRY                                                AS MAILING_COUNTRY
FROM RAW.MARYLAND_VOTERS_2023_12_05
  );
