
  create or replace   view DBT_VOTER_DATA.cleaned.nevada_voters
  
   as (
    SELECT '2023-07-31 '::date                           as FILE_DATE,
       'NV'                                          as STATE_CODE,
       VOTERS.RESIDENTIAL_COUNTY                     as COUNTY_CODE,
       VOTERS.VOTER_ID                               AS VOTER_ID,
       NULL                                          AS PREFIX,
       VOTERS.FIRST_NAME                             AS FIRST_NAME,
       VOTERS.MIDDLE_NAME                            AS MIDDLE_NAME,
       VOTERS.LAST_NAME                              AS LAST_NAME,
       VOTERS.SUFFIX                                 AS NAME_SUFFIX,
       VOTERS.RESIDENTIAL_ADDRESS_1                  AS RESIDENCE_ADDRESS_LINE_1,
       VOTERS.RESIDENTIAL_ADDRESS_2                  AS RESIDENCE_ADDRESS_LINE_2,
       RESIDENTIAL_CITY                              AS RESIDENCE_ADDRESS_CITY,
       COALESCE(RESIDENTIAL_STATE, 'NV')             AS RESIDENCE_ADDRESS_STATE,
       RESIDENTIAL_ZIP                               AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                         AS RESIDENCE_ADDRESS_COUNTRY,
       YEAR(TO_DATE(BIRTH_DATE, 'MM/DD/YYYY'))       AS BIRTH_YEAR,
       MONTH(TO_DATE(BIRTH_DATE, 'MM/DD/YYYY'))      AS BIRTH_MONTH,
       DAYOFMONTH(TO_DATE(BIRTH_DATE, 'MM/DD/YYYY')) AS BIRTH_DATE,
       CASE
           WHEN COUNTY_STATUS = 'Active' THEN 'A'
           WHEN COUNTY_STATUS = 'Inactive' THEN 'I'
           ELSE NULL
           END                                       as VOTER_STATUS,
       TRY_TO_DATE(REGISTRATION_DATE, 'MM/DD/YYYY')  AS REGISTRATION_DATE,
       NULL                                          AS LAST_VOTED_DATE,
       PARTY                                         AS LAST_PARTY_VOTED,
       VOTERS.CONGRESSIONAL_DISTRICT                 AS CONGRESSIONAL_DISTRICT,
       VOTERS.SENATE_DISTRICT                        AS STATE_SENATE_DISTRICT,
       ASSEMBLY_DISTRICT                             AS STATE_HOUSE_DISTRICT,
       NULL                                          AS JUDICIAL_DISTRICT,
       NULL                                          AS COUNTY_COMMISSION_DISTRICT,
       NULL                                          AS SCHOOL_BOARD_DISTRICT,
       NULL                                          AS CITY_COUNCIL_DISTRICT,
       REGISTERED_PRECINCT                           AS COUNTY_PRECINCT,
       NULL                                          AS MUNICIPAL_PRECINCT,
       NULL                                          AS RACE,
       NULL                                          AS GENDER,
       NULL                                          AS MAILING_ADDRESS_LINE_1,
       NULL                                          AS MAILING_ADDRESS_LINE_2,
       NULL                                          AS MAILING_LINE_3,
       NULL                                          AS MAILING_CITY,
       NULL                                          AS MAILING_STATE,
       NULL                                          AS MAILING_ZIPCODE,
       NULL                                          AS MAILING_COUNTRY
FROM RAW.NEVADA_VOTERS_2023_07_31 Voters
  );

