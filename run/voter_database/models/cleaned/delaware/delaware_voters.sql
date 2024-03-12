
  create or replace   view DBT_VOTER_DATA.cleaned.delaware_voters
  
   as (
    SELECT DISTINCT '2023-11-17'::date             as FILE_DATE,
                'DE'                           as STATE_CODE,
                COUNTY                         as COUNTY_CODE,
                VOTER_ID                       AS VOTER_ID,
                NULL                           AS PREFIX,
                NAME_FIRST                     AS FIRST_NAME,
                NAME_MIDDLE                    AS MIDDLE_NAME,
                NAME_LAST                      AS LAST_NAME,
                NAME_SUFFIX                    AS NAME_SUFFIX,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    RES_ADDR_HOUSE_NO_,
                    RES_ADDR_HOUSE_NO_SUFFIX,
                    RES_ADDR_STREET_DIRECTION_PREFIX,
                    RES_ADDR_STREET_NAME,
                    RES_ADDR_STREET_TYPE,
                    RES_ADDR_STREET_DIRECTION_SUFFIX
                    ])                         AS RESIDENCE_ADDRESS_LINE_1,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    RES_ADDR_UNIT_TYPE
                    ])                         AS RESIDENCE_ADDRESS_LINE_2,
                RES_ADDR_CITY                  AS RESIDENCE_ADDRESS_CITY,
                COALESCE(RES_ADDR_STATE, 'DE') AS RESIDENCE_ADDRESS_STATE,
                RES_ADDR_ZIP_CODE              AS RESIDENCE_ADDRESS_ZIPCODE,
                'USA'                          AS RESIDENCE_ADDRESS_COUNTRY,
                YEAR_OF_BIRTH                  AS BIRTH_YEAR,
                NULL                           AS BIRTH_MONTH,
                NULL                           AS BIRTH_DATE,
                STATUS                         as VOTER_STATUS,
                REGISTRATION_DATE::date        AS REGISTRATION_DATE,
                NULL                           AS LAST_VOTED_DATE,
                POLITICAL_PARTY                AS LAST_PARTY_VOTED,
                DISTRICT_CONGRESSIONAL         AS CONGRESSIONAL_DISTRICT,
                DISTRICT_SENATE                AS STATE_SENATE_DISTRICT,
                DISTRICT_REPRESENTATIVE        AS STATE_HOUSE_DISTRICT,
                NULL                           AS JUDICIAL_DISTRICT,
                NULL                           AS COUNTY_COMMISSION_DISTRICT,
                DISTRICT_SCHOOL                AS SCHOOL_BOARD_DISTRICT,
                NULL                           AS CITY_COUNCIL_DISTRICT,
                PRECINCT_RDED                  AS COUNTY_PRECINCT,
                NULL                           AS MUNICIPAL_PRECINCT,
                NULL                           AS RACE,
                NULL                           AS GENDER,
                MAIL_ADDR_LINE1                AS MAILING_ADDRESS_LINE_1,
                MAIL_ADDR_LINE2                AS MAILING_ADDRESS_LINE_2,
                MAIL_ADDR_LINE3                AS MAILING_LINE_3,
                MAIL_ADDR_CITY                 AS MAILING_CITY,
                MAIL_ADDR_STATE                AS MAILING_STATE,
                MAIL_ADDR_ZIP_4                AS MAILING_ZIPCODE,
                MAIL_ADDR_LINE4                AS MAILING_COUNTRY
FROM RAW.DELAWARE_VOTERS_2023_11_17
  );

