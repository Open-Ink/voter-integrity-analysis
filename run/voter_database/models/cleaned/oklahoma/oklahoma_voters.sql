
  create or replace   view DBT_VOTER_DATA.cleaned.oklahoma_voters
  
   as (
    SELECT '2023-09-23'::date                               as FILE_DATE,
       'OK'                                             as STATE_CODE,
       REPLACE(COUNTY_DESC, 'LEFLORE', 'Le Flore')      as COUNTY_CODE,
       VOTER_ID                                         AS VOTER_ID,
       NULL                                             AS PREFIX,
       FIRST_NAME                                       AS FIRST_NAME,
       MIDDLE_NAME                                      AS MIDDLE_NAME,
       LAST_NAME                                        AS LAST_NAME,
       SUFFIX                                           AS NAME_SUFFIX,
       MERGE_ADDRESS_ELEMENTS([
           STREET_NUM,
           STREET_DIR,
           STREET_NAME,
           STREET_TYPE,
           STREET_POST_DIR
           ])                                           AS RESIDENCE_ADDRESS_LINE_1,
       BLDG_NUM                                         AS RESIDENCE_ADDRESS_LINE_2,
       CITY                                             AS RESIDENCE_ADDRESS_CITY,
       'OK'                                             AS RESIDENCE_ADDRESS_STATE,
       ZIP                                              AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                            AS RESIDENCE_ADDRESS_COUNTRY,
       YEAR(TO_DATE(DATE_OF_BIRTH, 'MM/DD/YYYY'))       AS BIRTH_YEAR,
       MONTH(TO_DATE(DATE_OF_BIRTH, 'MM/DD/YYYY'))      AS BIRTH_MONTH,
       DAYOFMONTH(TO_DATE(DATE_OF_BIRTH, 'MM/DD/YYYY')) AS BIRTH_DATE,
       STATUS                                           as VOTER_STATUS,
       TO_DATE(REGISTRATION_DATE, 'MM/DD/YYYY')         AS REGISTRATION_DATE,
       NULL                                             AS LAST_VOTED_DATE,
       POLITAL_AFF                                      AS LAST_PARTY_VOTED,
       NULL                                             AS CONGRESSIONAL_DISTRICT,
       NULL                                             AS STATE_SENATE_DISTRICT,
       NULL                                             AS STATE_HOUSE_DISTRICT,
       NULL                                             AS JUDICIAL_DISTRICT,
       NULL                                             AS COUNTY_COMMISSION_DISTRICT,
       NULL                                             AS SCHOOL_BOARD_DISTRICT,
       NULL                                             AS CITY_COUNCIL_DISTRICT,
       PRECINCT                                         AS COUNTY_PRECINCT,
       NULL                                             AS MUNICIPAL_PRECINCT,
       NULL                                             AS RACE,
       NULL                                             AS GENDER,
       MAIL_STREET1                                     AS MAILING_ADDRESS_LINE_1,
       MAIL_STREET2                                     AS MAILING_ADDRESS_LINE_2,
       NULL                                             AS MAILING_LINE_3,
       MAIL_CITY                                        AS MAILING_CITY,
       MAIL_STATE                                       AS MAILING_STATE,
       MAIL_ZIP                                         AS MAILING_ZIPCODE,
       NULL                                             AS MAILING_COUNTRY
FROM RAW.OKLAHOMA_VOTERS_2023_09_23 VOTERS
  );

