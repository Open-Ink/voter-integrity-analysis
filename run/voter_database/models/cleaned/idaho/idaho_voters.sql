
  create or replace   view DBT_VOTER_DATA.cleaned.idaho_voters
  
   as (
    SELECT '2023-10-26 '::date                          as FILE_DATE,
       'ID'                                         as STATE_CODE,
       VOTERS.RES_COUNTY_DESC                       as COUNTY_CODE,
       VOTERS.VOTER_ID                              AS VOTER_ID,
       PREFIX                                       AS PREFIX,
       VOTERS.FIRST_NAME                            AS FIRST_NAME,
       VOTERS.MIDDLE_NAME                           AS MIDDLE_NAME,
       VOTERS.LAST_NAME                             AS LAST_NAME,
       VOTERS.SUFFIX                                AS NAME_SUFFIX,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           RES_HOUSE_NUMBER,
           RES_HOUSE_PARTIAL,
           RES_PRE_DIR,
           RES_STREET,
           RES_STREET_TYPE,
           RES_POST_DIR
           ])                                       AS RESIDENCE_ADDRESS_LINE_1,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           RES_SUB_LOCATION_TYPE,
           RES_SUB_LOCATION
           ])                                       AS RESIDENCE_ADDRESS_LINE_2,
       RES_CITY_DESC                                AS RESIDENCE_ADDRESS_CITY,
       COALESCE(RES_STATE, 'ID')                    AS RESIDENCE_ADDRESS_STATE,
       RES_ZIP5                                     AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                        AS RESIDENCE_ADDRESS_COUNTRY,
       NULL                                         AS BIRTH_YEAR,
       NULL                                         AS BIRTH_MONTH,
       NULL                                         AS BIRTH_DATE,
       'A'                                          as VOTER_STATUS,
       TRY_TO_DATE(REGISTRATION_DATE, 'MM/DD/YYYY') AS REGISTRATION_DATE,
       NULL                                         AS LAST_VOTED_DATE,
       PARTY_DESC                                   AS LAST_PARTY_VOTED,
       NULL                                         AS CONGRESSIONAL_DISTRICT,
       NULL                                         AS STATE_SENATE_DISTRICT,
       NULL                                         AS STATE_HOUSE_DISTRICT,
       NULL                                         AS JUDICIAL_DISTRICT,
       NULL                                         AS COUNTY_COMMISSION_DISTRICT,
       NULL                                         AS SCHOOL_BOARD_DISTRICT,
       NULL                                         AS CITY_COUNCIL_DISTRICT,
       PRECINCT_LABEL                               AS COUNTY_PRECINCT,
       NULL                                         AS MUNICIPAL_PRECINCT,
       NULL                                         AS RACE,
       NULL                                         AS GENDER,
       MAIL_RES_ADDR_1                              AS MAILING_ADDRESS_LINE_1,
       MAIL_RES_ADDR_2                              AS MAILING_ADDRESS_LINE_2,
       NULL                                         AS MAILING_LINE_3,
       MAIL_RES_CITY                                AS MAILING_CITY,
       MAIL_RES_STATE                               AS MAILING_STATE,
       MAIL_RES_ZIP                                 AS MAILING_ZIPCODE,
       MAIL_RES_COUNTRY                             AS MAILING_COUNTRY
FROM RAW.IDAHO_VOTERS_2023_10_26 Voters
WHERE RES_COUNTY_DESC IS NOT NULL
  );

