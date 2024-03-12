
  create or replace   view DBT_VOTER_DATA.cleaned.utah_voters
  
   as (
    SELECT '2023-09-25'::date          as FILE_DATE,
       'UT'                        as STATE_CODE,
       VOTERS.COUNTY               as COUNTY_CODE,
       VOTERS.VOTER_ID             AS VOTER_ID,
       NULL                        AS PREFIX,
       VOTERS.FIRST_NAME           AS FIRST_NAME,
       VOTERS.MIDDLE_NAME          AS MIDDLE_NAME,
       VOTERS.LAST_NAME            AS LAST_NAME,
       VOTERS.SUFFIX               AS NAME_SUFFIX,
       MERGE_ADDRESS_ELEMENTS([
           HOUSE_NUMBER,
           HOUSE_NUMBER_SUFFIX,
           STREET_DIRECTION_PREFIX,
           STREET,
           STREET_DIRECTION_SUFFIX,
           STREET_TYPE])           AS RESIDENCE_ADDRESS_LINE_1,
       MERGE_ADDRESS_ELEMENTS([
           UNIT_TYPE,
           UNIT_NUMBER])           AS RESIDENCE_ADDRESS_LINE_2,
       CITY                        AS RESIDENCE_ADDRESS_CITY,
       'UT'                        AS RESIDENCE_ADDRESS_STATE,
       ZIP                         AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                       AS RESIDENCE_ADDRESS_COUNTRY,
       NULL                        AS BIRTH_YEAR,
       NULL                        AS BIRTH_MONTH,
       NULL                        AS BIRTH_DATE,
       CASE
           WHEN VOTER_STATUS = 'Active' THEN 'A'
           WHEN VOTER_STATUS = 'Inactive' THEN 'I'
           END                     as VOTER_STATUS,
       NULL                        AS REGISTRATION_DATE,
       NULL                        AS LAST_VOTED_DATE,
       NULL                        AS LAST_PARTY_VOTED,
       CONGRESSIONAL_DISTRICT      AS CONGRESSIONAL_DISTRICT,
       STATE_SENATE_DISTRICT       AS STATE_SENATE_DISTRICT,
       STATE_HOUSE_DISTRICT        AS STATE_HOUSE_DISTRICT,
       NULL                        AS JUDICIAL_DISTRICT,
       NULL                        AS COUNTY_COMMISSION_DISTRICT,
       STATE_SCHOOL_BOARD_DISTRICT AS SCHOOL_BOARD_DISTRICT,
       CITY_COUNCIL_DISTRICT       AS CITY_COUNCIL_DISTRICT,
       PRECINCT                    AS COUNTY_PRECINCT,
       NULL                        AS MUNICIPAL_PRECINCT,
       NULL                        AS RACE,
       NULL                        AS GENDER,
       MAILING_ADDRESS             AS MAILING_ADDRESS_LINE_1,
       NULL                        AS MAILING_ADDRESS_LINE_2,
       NULL                        AS MAILING_LINE_3,
       MAILING_CITY                AS MAILING_CITY,
       NULL                        AS MAILING_STATE,
       NULL                        AS MAILING_ZIPCODE,
       NULL                        AS MAILING_COUNTRY
FROM RAW.UTAH_VOTERS_2023_11_06 Voters
  );

