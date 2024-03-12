
  create or replace   view DBT_VOTER_DATA.cleaned.louisiana_voters
  
   as (
    with __dbt__cte__louisiana_counties as (


SELECT *
FROM (VALUES ('01', 'Acadia'),
             ('02', 'Allen'),
             ('03', 'Ascension'),
             ('04', 'Assumption'),
             ('05', 'Avoyelles'),
             ('06', 'Beauregard'),
             ('07', 'Bienville'),
             ('08', 'Bossier'),
             ('09', 'Caddo'),
             ('10', 'Calcasieu'),
             ('11', 'Caldwell'),
             ('12', 'Cameron'),
             ('13', 'Catahoula'),
             ('14', 'Claiborne'),
             ('15', 'Concordia'),
             ('16', 'De Soto'),
             ('17', 'East Baton Rouge'),
             ('18', 'East Carroll'),
             ('19', 'East Feliciana'),
             ('20', 'Evangeline'),
             ('21', 'Franklin'),
             ('22', 'Grant'),
             ('23', 'Iberia'),
             ('24', 'Iberville'),
             ('25', 'Jackson'),
             ('26', 'Jefferson'),
             ('27', 'Jefferson Davis'),
             ('28', 'LaSalle'),
             ('29', 'Lafayette'),
             ('30', 'Lafourche'),
             ('31', 'Lincoln'),
             ('32', 'Livingston'),
             ('33', 'Madison'),
             ('34', 'Morehouse'),
             ('35', 'Natchitoches'),
             ('36', 'Orleans'),
             ('37', 'Ouachita'),
             ('38', 'Plaquemines'),
             ('39', 'Pointe Coupee'),
             ('40', 'Rapides'),
             ('41', 'Red River'),
             ('42', 'Richland'),
             ('43', 'Sabine'),
             ('44', 'St Bernard'),
             ('45', 'St Charles'),
             ('46', 'St Helena'),
             ('47', 'St James'),
             ('48', 'St John The Baptist'),
             ('49', 'St Landry'),
             ('50', 'St Martin'),
             ('51', 'St Mary'),
             ('52', 'St Tammany'),
             ('53', 'Tangipahoa'),
             ('54', 'Tensas'),
             ('55', 'Terrebonne'),
             ('56', 'Union'),
             ('57', 'Vermilion'),
             ('58', 'Vernon'),
             ('59', 'Washington'),
             ('60', 'Webster'),
             ('61', 'West Baton Rouge'),
             ('62', 'West Carroll'),
             ('63', 'West Feliciana'),
             ('64', 'Winn')) AS A (COUNTY_ID, COUNTY_NAME)
) SELECT DISTINCT '2023-11-23'::date                       as FILE_DATE,
                'LA'                                     as STATE_CODE,
                C.COUNTY_NAME                           as COUNTY_CODE,
                REGISTRATION_NUMBER                      AS VOTER_ID,
                PERSONAL_NAME_PREFIX                     AS PREFIX,
                PERSONAL_FIRST_NAME                      AS FIRST_NAME,
                PERSONAL_MIDDLE_NAME                     AS MIDDLE_NAME,
                PERSONAL_LAST_NAME                       AS LAST_NAME,
                PERSONAL_NAME_SUFFIX                     AS NAME_SUFFIX,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    RESIDENCE_HOUSE_NUMBER,
                    RESIDENCE_HOUSE_FRACTION,
                    RESIDENCE_STREET_DIRECTION,
                    RESIDENCE_STREET_NAME
                    ])                                   AS RESIDENCE_ADDRESS_LINE_1,
                PUBLIC.MERGE_ADDRESS_ELEMENTS([
                    RESIDENCE_APARTMENT_NUMBER
                    ])                                   AS RESIDENCE_ADDRESS_LINE_2,
                RESIDENCE_CITY                           AS RESIDENCE_ADDRESS_CITY,
                COALESCE(RESIDENCE_STATE, 'LA')          AS RESIDENCE_ADDRESS_STATE,
                RESIDENCE_ZIPCODE5                       AS RESIDENCE_ADDRESS_ZIPCODE,
                'USA'                                    AS RESIDENCE_ADDRESS_COUNTRY,
                NULL                                     AS BIRTH_YEAR,
                NULL                                     AS BIRTH_MONTH,
                NULL                                     AS BIRTH_DATE,
                REGISTRATION_VOTER_STATUS                as VOTER_STATUS,
                TO_DATE(REGISTRATION_DATE, 'MM/DD/YYYY') AS REGISTRATION_DATE,
                TO_DATE(LAST_VOTED, 'MM/DD/YYYY')        AS LAST_VOTED_DATE,
                REGISTRATION_POLITICAL_PARTY_CODE        AS LAST_PARTY_VOTED,
                JURISDICTION_DISTRICT_CONGRESSIONAL      AS CONGRESSIONAL_DISTRICT,
                JURISDICTION_DISTRICT_SENATE             AS STATE_SENATE_DISTRICT,
                JURISDICTION_DISTRICT_REPRESENTATIVE     AS STATE_HOUSE_DISTRICT,
                JURISDICTION_DISTRICT_DISTRICT_COURT     AS JUDICIAL_DISTRICT,
                NULL                                     AS COUNTY_COMMISSION_DISTRICT,
                JURISDICTION_DISTRICT_SCHOOL_BOARD       AS SCHOOL_BOARD_DISTRICT,
                NULL                                     AS CITY_COUNCIL_DISTRICT,
                JURISDICTION_PRECINCT                    AS COUNTY_PRECINCT,
                NULL                                     AS MUNICIPAL_PRECINCT,
                NULL                                     AS RACE,
                NULL                                     AS GENDER,
                MAIL_ADDRESS1                            AS MAILING_ADDRESS_LINE_1,
                MAIL_ADDRESS2                            AS MAILING_ADDRESS_LINE_2,
                NULL                                     AS MAILING_LINE_3,
                MAIL_CITY                                AS MAILING_CITY,
                MAIL_STATE                               AS MAILING_STATE,
                MAIL_ZIPCODE5                            AS MAILING_ZIPCODE,
                MAIL_COUNTRY                             AS MAILING_COUNTRY
FROM RAW.LOUISIANA_RAW_DATA_2023_11_23 V
         INNER JOIN __dbt__cte__louisiana_counties C ON V.JURISDICTION_PARISH = C.COUNTY_ID
  );

