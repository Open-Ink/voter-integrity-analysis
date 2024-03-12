
  create or replace   view DBT_VOTER_DATA.cleaned.alaska_voters
  
   as (
    SELECT '2023-11-13'::date                  as FILE_DATE,
       'AK'                                as STATE_CODE,
       NCOA.COUNTY_NAME                    as COUNTY_CODE,
       ASCENSION                           AS VOTER_ID,
       NULL                                AS PREFIX,
       VOTERS.FIRST_NAME                   AS FIRST_NAME,
       VOTERS.MIDDLE_NAME                  AS MIDDLE_NAME,
       VOTERS.LAST_NAME                    AS LAST_NAME,
       VOTERS.SUFFIX_NAME                  AS NAME_SUFFIX,
       RESIDENCE_ADDRESS                   AS RESIDENCE_ADDRESS_LINE_1,
       NULL                                AS RESIDENCE_ADDRESS_LINE_2,
       RESIDENCE_CITY                      AS RESIDENCE_ADDRESS_CITY,
       'AK'                                AS RESIDENCE_ADDRESS_STATE,
       RESIDENCE_ZIP                       AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                               AS RESIDENCE_ADDRESS_COUNTRY,
       NULL                                AS BIRTH_YEAR,
       NULL                                AS BIRTH_MONTH,
       NULL                                AS BIRTH_DATE,
       'A'                                 as VOTER_STATUS,
       TO_DATE(ORG_REG_DATE, 'MM/DD/YYYY') AS REGISTRATION_DATE,
       NULL                                AS LAST_VOTED_DATE,
       PARTY                               AS LAST_PARTY_VOTED,
       NULL                                AS CONGRESSIONAL_DISTRICT,
       NULL                                AS STATE_SENATE_DISTRICT,
       NULL                                AS STATE_HOUSE_DISTRICT,
       NULL                                AS JUDICIAL_DISTRICT,
       NULL                                AS COUNTY_COMMISSION_DISTRICT,
       NULL                                AS SCHOOL_BOARD_DISTRICT,
       NULL                                AS CITY_COUNCIL_DISTRICT,
       NULL                                AS COUNTY_PRECINCT,
       NULL                                AS MUNICIPAL_PRECINCT,
       NULL                                AS RACE,
       GENDER                              AS GENDER,
       MAILING_ADDRESS1                    AS MAILING_ADDRESS_LINE_1,
       MAILING_ADDRESS2                    AS MAILING_ADDRESS_LINE_2,
       MAILING_ADDRESS3                    AS MAILING_LINE_3,
       MAILING_CITY                        AS MAILING_CITY,
       MAILING_STATE                       AS MAILING_STATE,
       MAILING_ZIP                         AS MAILING_ZIPCODE,
       MAILING_COUNTRY                     AS MAILING_COUNTRY
FROM RAW.ALASKA_VOTERS_2023_11_13 VOTERS
         INNER JOIN RAW.ALASKA_NCOA_RESULTS_2023_11_13 NCOA ON NCOA.INPUT_ASCENSION = VOTERS.ASCENSION
WHERE NCOA.RECORD_TYPE IN ('A', 'H')


  );

