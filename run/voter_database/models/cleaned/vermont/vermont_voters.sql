
  create or replace   view DBT_VOTER_DATA.cleaned.vermont_voters
  
   as (
    SELECT '2023-09-27'::date                          as FILE_DATE,
       'VT'                                        as STATE_CODE,
       COUNTY                                      as COUNTY_CODE,
       VOTER_ID                                    AS VOTER_ID,
       NULL                                        AS PREFIX,
       FIRST_NAME                                  AS FIRST_NAME,
       MIDDLE_NAME                                 AS MIDDLE_NAME,
       LAST_NAME                                   AS LAST_NAME,
       SUFFIX                                      AS NAME_SUFFIX,
       LEGAL_ADDRESS_LINE_1                        AS RESIDENCE_ADDRESS_LINE_1,
       LEGAL_ADDRESS_LINE_2                        AS RESIDENCE_ADDRESS_LINE_2,
       LEGAL_ADDRESS_CITY                          AS RESIDENCE_ADDRESS_CITY,
       COALESCE(LEGAL_ADDRESS_STATE, 'VT')         AS RESIDENCE_ADDRESS_STATE,
       LEGAL_ADDRESS_ZIP                           AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                       AS RESIDENCE_ADDRESS_COUNTRY,
       YEAR_OF_BIRTH                               AS BIRTH_YEAR,
       NULL                                        AS BIRTH_MONTH,
       NULL                                        AS BIRTH_DATE,
       CASE
           WHEN STATUS = 'ACTIVE' THEN 'A'
           WHEN STATUS = 'CHALLENGED' THEN 'C'
           WHEN STATUS = 'N18' THEN 'N18' END      as VOTER_STATUS,
       TO_DATE(DATE_OF_REGISTRATION, 'MM/DD/YYYY') AS REGISTRATION_DATE,
       TO_DATE(DATE_LAST_VOTED, 'MM/DD/YYYY')      AS LAST_VOTED_DATE,
       NULL                                        AS LAST_PARTY_VOTED,
       NULL                                        AS CONGRESSIONAL_DISTRICT,
       SENATE_DISTRICT                             AS STATE_SENATE_DISTRICT,
       NULL                                        AS STATE_HOUSE_DISTRICT,
       NULL                                        AS JUDICIAL_DISTRICT,
       NULL                                        AS COUNTY_COMMISSION_DISTRICT,
       SCHOOL_DISTRICT                             AS SCHOOL_BOARD_DISTRICT,
       NULL                                        AS CITY_COUNCIL_DISTRICT,
       VOTING_DISTRICT                             AS COUNTY_PRECINCT,
       NULL                                        AS MUNICIPAL_PRECINCT,
       NULL                                        AS RACE,
       NULL                                        AS GENDER,
       MAILING_ADDRESS_LINE_1                      AS MAILING_ADDRESS_LINE_1,
       MAILING_ADDRESS_LINE_2                      AS MAILING_ADDRESS_LINE_2,
       NULL                                        AS MAILING_LINE_3,
       MAILING_ADDRESS_CITY                        AS MAILING_CITY,
       MAILING_ADDRESS_STATE                       AS MAILING_STATE,
       MAILING_ADDRESS_ZIP                         AS MAILING_ZIPCODE,
       NULL                                        AS MAILING_COUNTRY
FROM RAW.VERMONT_VOTERS_2023_09_27
  );

