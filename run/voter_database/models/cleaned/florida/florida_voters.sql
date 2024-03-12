
  create or replace   view DBT_VOTER_DATA.cleaned.florida_voters
  
   as (
    with __dbt__cte__florida_counties as (


SELECT *
FROM (VALUES ('ALA', 'Alachua'),
             ('HAM', 'Hamilton'),
             ('OKE', 'Okeechobee'),
             ('BAK', 'Baker'),
             ('HAR', 'Hardee'),
             ('ORA', 'Orange'),
             ('BAY', 'Bay'),
             ('HEN', 'Hendry'),
             ('OSC', 'Osceola'),
             ('BRA', 'Bradford'),
             ('HER', 'Hernando'),
             ('PAL', 'Palm Beach'),
             ('BRE', 'Brevard'),
             ('HIG', 'Highlands'),
             ('PAS', 'Pasco'),
             ('BRO', 'Broward'),
             ('HIL', 'Hillsborough'),
             ('PIN', 'Pinellas'),
             ('CAL', 'Calhoun'),
             ('HOL', 'Holmes'),
             ('POL', 'Polk'),
             ('CHA', 'Charlotte'),
             ('IND', 'Indian River'),
             ('PUT', 'Putnam'),
             ('CIT', 'Citrus'),
             ('JAC', 'Jackson'),
             ('SAN', 'Santa Rosa'),
             ('CLA', 'Clay'),
             ('JEF', 'Jefferson'),
             ('SAR', 'Sarasota'),
             ('CLL', 'Collier'),
             ('LAF', 'Lafayette'),
             ('SEM', 'Seminole'),
             ('CLM', 'Columbia'),
             ('LAK', 'Lake'),
             ('STJ', 'Saint Johns'),
             ('DAD', 'Miami-Dade'),
             ('LEE', 'Lee'),
             ('STL', 'Saint Lucie'),
             ('DES', 'Desoto'),
             ('LEO', 'Leon'),
             ('SUM', 'Sumter'),
             ('DIX', 'Dixie'),
             ('LEV', 'Levy'),
             ('SUW', 'Suwannee'),
             ('DUV', 'Duval'),
             ('LIB', 'Liberty'),
             ('TAY', 'Taylor'),
             ('ESC', 'Escambia'),
             ('MAD', 'Madison'),
             ('UNI', 'Union'),
             ('FLA', 'Flagler'),
             ('MAN', 'Manatee'),
             ('VOL', 'Volusia'),
             ('FRA', 'Franklin'),
             ('MRN', 'Marion'),
             ('WAK', 'Wakulla'),
             ('GAD', 'Gadsden'),
             ('MRT', 'Martin'),
             ('WAL', 'Walton'),
             ('GIL', 'Gilchrist'),
             ('MON', 'Monroe'),
             ('WAS', 'Washington'),
             ('GLA', 'Glades'),
             ('NAS', 'Nassau'),
             ('GUL', 'Gulf'),
             ('OKA', 'Okaloosa'))
         AS A (CODE, NAME)
) SELECT '2023-08-08'::date                              as FILE_DATE,
       'FL'                                            as STATE_CODE,
       C.NAME                                          as COUNTY_CODE,
       V.VOTER_ID                                      AS VOTER_ID,
       NULL                                            AS PREFIX,
       V.FIRST_NAME                                    AS FIRST_NAME,
       V.MIDDLE_NAME                                   AS MIDDLE_NAME,
       V.LAST_NAME                                     AS LAST_NAME,
       V.NAME_SUFFIX                                   AS NAME_SUFFIX,
       V.ADDRESS_LINE_1                                AS RESIDENCE_ADDRESS_LINE_1,
       V.ADDRESS_LINE_2                                   RESIDENCE_ADDRESS_LINE_2,
       V.ADDRESS_CITY                                  AS RESIDENCE_ADDRESS_CITY,
       COALESCE(V.ADDRESS_STATE, 'FL')                 AS RESIDENCE_ADDRESS_STATE,
       V.ADDRESS_ZIPCODE                               AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                           AS RESIDENCE_ADDRESS_COUNTRY,
       YEAR(TO_DATE(V.BIRTH_DATE, 'MM/DD/YYYY'))       AS BIRTH_YEAR,
       MONTH(TO_DATE(V.BIRTH_DATE, 'MM/DD/YYYY'))      AS BIRTH_MONTH,
       DAYOFMONTH(TO_DATE(V.BIRTH_DATE, 'MM/DD/YYYY')) AS BIRTH_DATE,
       CASE
           WHEN V.VOTER_STATUS = 'ACT' THEN 'A'
           WHEN V.VOTER_STATUS = 'INA' THEN 'I'
           ELSE V.VOTER_STATUS
           END                                         as VOTER_STATUS,
       TO_DATE(V.REGISTRATION_DATE, 'MM/DD/YYYY')      AS REGISTRATION_DATE,
       NULL                                            AS LAST_VOTED_DATE,
       NULL                                            AS LAST_PARTY_VOTED,
       V.CONGRESSIONAL_DISTRICT                        AS CONGRESSIONAL_DISTRICT,
       V.SENATE_DISTRICT                               AS STATE_SENATE_DISTRICT,
       V.HOUSE_DISTRICT                                AS STATE_HOUSE_DISTRICT,
       NULL                                            AS JUDICIAL_DISTRICT,
       V.COUNTY_COMMISSION_DISTRICT                    AS COUNTY_COMMISSION_DISTRICT,
       V.SCHOOL_BOARD_DISTRICT                         AS SCHOOL_BOARD_DISTRICT,
       NULL                                            AS CITY_COUNCIL_DISTRICT,
       V.PRECINCT                                      AS COUNTY_PRECINCT,
       NULL                                            AS MUNICIPAL_PRECINCT,
       CASE
           WHEN V.RACE = '1' THEN 'American Indian or Alaskan Native'
           WHEN V.RACE = '2' THEN 'Asian/Pacific Islander'
           WHEN V.RACE = '3' THEN 'Black not of Hispanic Origin'
           WHEN V.RACE = '4' THEN 'Hispanic/Latino'
           WHEN V.RACE = '5' THEN 'White'
           WHEN V.RACE = '6' THEN 'Other'
           WHEN V.RACE = '7' THEN 'Multi-racial'
           WHEN V.RACE = '9' THEN 'Unknown'
           END                                         AS RACE,
       V.GENDER                                        AS GENDER,
       V.MAILING_ADDRESS_LINE_1                        AS MAILING_ADDRESS_LINE_1,
       V.MAILING_ADDRESS_LINE_2                        AS MAILING_ADDRESS_LINE_2,
       V.MAILING_ADDRESS_LINE_3                        AS MAILING_LINE_3,
       V.MAILING_ADDRESS_CITY                          AS MAILING_CITY,
       V.MAILING_ADDRESS_STATE                         AS MAILING_STATE,
       V.MAILING_ADDRESS_ZIPCODE                       AS MAILING_ZIPCODE,
       V.MAILING_ADDRESS_COUNTRY                       AS MAILING_COUNTRY
FROM RAW.FLORIDA_VOTERS_2023_08_08 V
         LEFT JOIN __dbt__cte__florida_counties C ON REPLACE(V.COUNTY, '.', '') = C.CODE
WHERE (HAS_REQUESTED_EXEMPTION IS NULL OR HAS_REQUESTED_EXEMPTION = 'N')
  );

