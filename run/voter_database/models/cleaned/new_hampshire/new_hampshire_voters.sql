
  create or replace   view DBT_VOTER_DATA.cleaned.new_hampshire_voters
  
   as (
    SELECT '2023-12-04 '::date               as FILE_DATE,
       'NH'                              as STATE_CODE,
       VOTERS.COUNTY                     as COUNTY_CODE,
       VOTERS.ID_VOTER                   AS VOTER_ID,
       NULL                              AS PREFIX,
       VOTERS.NM_FIRST                   AS FIRST_NAME,
       VOTERS.NM_MID                     AS MIDDLE_NAME,
       VOTERS.NM_LAST                    AS LAST_NAME,
       VOTERS.NM_SUFF                    AS NAME_SUFFIX,
       VOTERS.AD_STR1                    AS RESIDENCE_ADDRESS_LINE_1,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           VOTERS.AD_UNIT, VOTERS.AD_STR2,
           AD_STR3])                     AS RESIDENCE_ADDRESS_LINE_2,
       AD_CITY                           AS RESIDENCE_ADDRESS_CITY,
       COALESCE(AD_ST, 'NH')             AS RESIDENCE_ADDRESS_STATE,
       AD_ZIP5                           AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                             AS RESIDENCE_ADDRESS_COUNTRY,
       NULL                              AS BIRTH_YEAR,
       NULL                              AS BIRTH_MONTH,
       NULL                              AS BIRTH_DATE,
       'A'                               as VOTER_STATUS,
       NULL                              AS REGISTRATION_DATE,
       NULL                              AS LAST_VOTED_DATE,
       CD_PARTY                          AS LAST_PARTY_VOTED,
       NULL                              AS CONGRESSIONAL_DISTRICT,
       NULL                              AS STATE_SENATE_DISTRICT,
       NULL                              AS STATE_HOUSE_DISTRICT,
       NULL                              AS JUDICIAL_DISTRICT,
       NULL                              AS COUNTY_COMMISSION_DISTRICT,
       NULL                              AS SCHOOL_BOARD_DISTRICT,
       NULL                              AS CITY_COUNCIL_DISTRICT,
       NULL                              AS COUNTY_PRECINCT,
       NULL                              AS MUNICIPAL_PRECINCT,
       NULL                              AS RACE,
       NULL                              AS GENDER,
       MAIL_STR1                         AS MAILING_ADDRESS_LINE_1,
       MAIL_STR2                         AS MAILING_ADDRESS_LINE_2,
       MAIL_STR3                         AS MAILING_LINE_3,
       COALESCE(MAIL_CITY, AD_MAIL_CITY) AS MAILING_CITY,
       MAIL_ST                           AS MAILING_STATE,
       MAIL_ZIP5                         AS MAILING_ZIPCODE,
       NULL                              AS MAILING_COUNTRY
FROM RAW.NEW_HAMPSHIRE_VOTERS_2023_12_04 Voters
  );

