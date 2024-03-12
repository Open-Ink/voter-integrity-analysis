
  create or replace   view DBT_VOTER_DATA.cleaned.nebraska_voters
  
   as (
    SELECT '2023-11-01'::date                               as FILE_DATE,
       'NE'                                             as STATE_CODE,
       REPLACE(VOTERS.DB_LOGID, 'ST_CLAIR', 'St Clair') as COUNTY_CODE,
       VOTERS.TEXT_REGISTRANT_ID                        AS VOTER_ID,
       CDE_NAME_TITLE                                   AS PREFIX,
       VOTERS.TEXT_NAME_FIRST                           AS FIRST_NAME,
       VOTERS.TEXT_NAME_MIDDLE                          AS MIDDLE_NAME,
       VOTERS.TEXT_NAME_LAST                            AS LAST_NAME,
       VOTERS.CDE_NAME_SUFFIX                           AS NAME_SUFFIX,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           TEXT_RES_ADDRESS_NBR, TEXT_RES_ADDRESS_NBR_SUFFIX,
           CDE_STREET_DIR_PREFIX,
           TEXT_STREET_NAME,
           CDE_STREET_TYPE,
           CDE_STREET_DIR_SUFFIX ])                     AS RESIDENCE_ADDRESS_LINE_1,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           CDE_RES_UNIT_TYPE, TEXT_RES_UNIT_NBR ])      AS RESIDENCE_ADDRESS_LINE_2,
       TEXT_RES_CITY                                    AS RESIDENCE_ADDRESS_CITY,
       COALESCE(CDE_RES_STATE, 'NE')                    AS RESIDENCE_ADDRESS_STATE,
       TEXT_RES_ZIP5                                    AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                            AS RESIDENCE_ADDRESS_COUNTRY,
       BIRTH_YEAR                                       AS BIRTH_YEAR,
       NULL                                             AS BIRTH_MONTH,
       NULL                                             AS BIRTH_DATE,
       CDE_REGISTRANT_STATUS                            as VOTER_STATUS,
       TO_DATE(DATE_OF_REGISTRATION, 'MM/DD/YYYY')      AS REGISTRATION_DATE,
       NULL                                             AS LAST_VOTED_DATE,
       DESC_PARTY                                       AS LAST_PARTY_VOTED,
       VOTERS.DISTRICT_CD                               AS CONGRESSIONAL_DISTRICT,
       VOTERS.DISTRICT_SE                               AS STATE_SENATE_DISTRICT,
       DISTRICT_HO                                      AS STATE_HOUSE_DISTRICT,
       VOTERS.DISTRICT_JD                               AS JUDICIAL_DISTRICT,
       NULL                                             AS COUNTY_COMMISSION_DISTRICT,
       DISTRICT_SD                                      AS SCHOOL_BOARD_DISTRICT,
       NULL                                             AS CITY_COUNCIL_DISTRICT,
       PRECINCT_TEXT_NAME                               AS COUNTY_PRECINCT,
       NULL                                             AS MUNICIPAL_PRECINCT,
       NULL                                             AS RACE,
       NULL                                             AS GENDER,
       TEXT_MAIL_ADDRESS1                               AS MAILING_ADDRESS_LINE_1,
       TEXT_MAIL_ADDRESS2                               AS MAILING_ADDRESS_LINE_2,
       TEXT_MAIL_ADDRESS3                               AS MAILING_LINE_3,
       TEXT_MAIL_CITY                                   AS MAILING_CITY,
       CDE_MAIL_STATE                                   AS MAILING_STATE,
       TEXT_MAIL_ZIP5                                   AS MAILING_ZIPCODE,
       TEXT_MAIL_ADDRESS4                               AS MAILING_COUNTRY
FROM RAW.NEBRASKA_VOTERS_2023_11_01 VOTERS
  );

