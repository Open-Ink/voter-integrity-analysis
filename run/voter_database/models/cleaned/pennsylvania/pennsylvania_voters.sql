
  create or replace   view DBT_VOTER_DATA.cleaned.pennsylvania_voters
  
   as (
    SELECT '2023-11-13'::date                        as FILE_DATE,
       'PA'                                       as STATE_CODE,
       VOTERS.COUNTY                              as COUNTY_CODE,
       VOTERS.ID_NUMBER                           AS VOTER_ID,
       TITLE                                      AS PREFIX,
       VOTERS.FIRST_NAME                          AS FIRST_NAME,
       VOTERS.MIDDLE_NAME                         AS MIDDLE_NAME,
       VOTERS.LAST_NAME                           AS LAST_NAME,
       VOTERS.SUFFIX                              AS NAME_SUFFIX,
       MERGE_ADDRESS_ELEMENTS([
           HOUSE_NUMBER,
           HOUSE_NUMBER_SUFFIX,
           STREET_NAME
           ])                                     AS RESIDENCE_ADDRESS_LINE_1,
       COALESCE(ADDRESS_LINE_2, APARTMENT_NUMBER) AS RESIDENCE_ADDRESS_LINE_2,
       CITY                                       AS RESIDENCE_ADDRESS_CITY,
       COALESCE(STATE, 'PA')                      AS RESIDENCE_ADDRESS_STATE,
       ZIP                                        AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                      AS RESIDENCE_ADDRESS_COUNTRY,
       YEAR(TO_DATE(DOB, 'MM/DD/YYYY'))           AS BIRTH_YEAR,
       MONTH(TO_DATE(DOB, 'MM/DD/YYYY'))          AS BIRTH_MONTH,
       DAYOFMONTH(TO_DATE(DOB, 'MM/DD/YYYY'))     AS BIRTH_DATE,
       CASE
           WHEN VOTER_STATUS = 'A' THEN 'A'
           WHEN VOTER_STATUS = 'I' THEN 'I'
           ELSE NULL
           END                                    as VOTER_STATUS,
       TO_DATE(REGISTRATION_DATE, 'MM/DD/YYYY')   AS REGISTRATION_DATE,
       TO_DATE(LAST_VOTE_DATE, 'MM/DD/YYYY')      AS LAST_VOTED_DATE,
       PARTY_CODE                                 AS LAST_PARTY_VOTED,
       DISTRICT_8                                 AS CONGRESSIONAL_DISTRICT,
       VOTERS.DISTRICT_7                          AS STATE_SENATE_DISTRICT,
       VOTERS.DISTRICT_6                          AS STATE_HOUSE_DISTRICT,
       NULL                                       AS JUDICIAL_DISTRICT,
       NULL                                       AS COUNTY_COMMISSION_DISTRICT,
       NULL                                       AS SCHOOL_BOARD_DISTRICT,
       NULL                                       AS CITY_COUNCIL_DISTRICT,
       PRECINCT_CODE                              AS COUNTY_PRECINCT,
       NULL                                       AS MUNICIPAL_PRECINCT,
       NULL                                       AS RACE,
       GENDER                                     AS GENDER,
       MAIL_ADDRESS_1                             AS MAILING_ADDRESS_LINE_1,
       MAIL_ADDRESS_2                             AS MAILING_ADDRESS_LINE_2,
       NULL                                       AS MAILING_LINE_3,
       MAIL_CITY                                  AS MAILING_CITY,
       MAIL_STATE                                 AS MAILING_STATE,
       MAIL_ZIP                                   AS MAILING_ZIPCODE,
       MAIL_COUNTRY                               AS MAILING_COUNTRY
FROM RAW.PENNSYLVANIA_VOTERS_2023_11_13 Voters
  );

