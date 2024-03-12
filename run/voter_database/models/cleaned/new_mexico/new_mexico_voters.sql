
  create or replace   view DBT_VOTER_DATA.cleaned.new_mexico_voters
  
   as (
    SELECT '2023-11-17 '::date                                  as FILE_DATE,
       'NM'                                                 as STATE_CODE,
       VOTERS.COUNTY                                        as COUNTY_CODE,
       VOTERS.ID                                            AS VOTER_ID,
       NULL                                                 AS PREFIX,
       VOTERS.FIRST_NAME                                    AS FIRST_NAME,
       VOTERS.MIDDLE_NAME                                   AS MIDDLE_NAME,
       VOTERS.LAST_NAME                                     AS LAST_NAME,
       VOTERS.NAME_SUFFIX                                   AS NAME_SUFFIX,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           RESIDENCE_HOUSE_NO,
           RESIDENCE_STREET_PREFIX,
           RESIDENCE_STREET_NAME,
           RESIDENCE_STREET_TYPE,
           RESIDENCE_STREET_SUFFIX
           ])                                               AS RESIDENCE_ADDRESS_LINE_1,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           RESIDENCE_UNIT_TYPE,
           RESIDENCE_UNIT_NO
           ])                                               AS RESIDENCE_ADDRESS_LINE_2,
       RESIDENCE_CITY                                       AS RESIDENCE_ADDRESS_CITY,
       COALESCE(RESIDENCE_STATE, 'ID')                      AS RESIDENCE_ADDRESS_STATE,
       RESIDENCE_ZIP                                        AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                                AS RESIDENCE_ADDRESS_COUNTRY,
       DOB_RESTRICTED                                       AS BIRTH_YEAR,
       NULL                                                 AS BIRTH_MONTH,
       NULL                                                 AS BIRTH_DATE,
       CASE WHEN STATUS = 'Active' THEN 'A' ELSE STATUS END as VOTER_STATUS,
       TO_DATE(REGISTRATION_DATE, 'MM/DD/YYYY')             AS REGISTRATION_DATE,
       NULL                                                 AS LAST_VOTED_DATE,
       PARTY                                                AS LAST_PARTY_VOTED,
       CONGRESSIONAL                                        AS CONGRESSIONAL_DISTRICT,
       SENATE                                               AS STATE_SENATE_DISTRICT,
       LEGISLATIVE                                          AS STATE_HOUSE_DISTRICT,
       JUDICIAL_DISTRICT                                    AS JUDICIAL_DISTRICT,
       NULL                                                 AS COUNTY_COMMISSION_DISTRICT,
       SCHOOL_BOARD                                         AS SCHOOL_BOARD_DISTRICT,
       NULL                                                 AS CITY_COUNCIL_DISTRICT,
       PRECINCT_PART                                        AS COUNTY_PRECINCT,
       NULL                                                 AS MUNICIPAL_PRECINCT,
       NULL                                                 AS RACE,
       GENDER                                               AS GENDER,
       MAILING_ADDRESS                                      AS MAILING_ADDRESS_LINE_1,
       MAILING_ADDRESS_LINE_2                               AS MAILING_ADDRESS_LINE_2,
       NULL                                                 AS MAILING_LINE_3,
       MAILING_CITY                                         AS MAILING_CITY,
       MAILING_STATE                                        AS MAILING_STATE,
       MAILING_ZIP                                          AS MAILING_ZIPCODE,
       MAILING_COUNTRY                                      AS MAILING_COUNTRY
FROM RAW.NEW_MEXICO_RAW_DATA_2023_11_17 Voters
  );
