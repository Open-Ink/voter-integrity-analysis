
  create or replace   view DBT_VOTER_DATA.cleaned.montana_voters
  
   as (
    with __dbt__cte__montana_counties as (

SELECT *
FROM (VALUES ('01', 'Beaverhead'),
             ('11', 'Dawson'),
             ('21', 'Hill'),
             ('31', 'Mineral'),
             ('41', 'Ravalli'),
             ('51', 'Toole'),
             ('02', 'Big Horn'),
             ('12', 'Deer Lodge'),
             ('22', 'Jefferson'),
             ('32', 'Missoula'),
             ('42', 'Richland'),
             ('52', 'Treasure'),
             ('03', 'Blaine'),
             ('13', 'Fallon'),
             ('23', 'Judith Basin'),
             ('33', 'Musselshell'),
             ('43', 'Roosevelt'),
             ('53', 'Valley'),
             ('04', 'Broadwater'),
             ('14', 'Fergus'),
             ('24', 'Lake'),
             ('34', 'Park'),
             ('44', 'Rosebud'),
             ('54', 'Wheatland'),
             ('05', 'Carbon'),
             ('15', 'Flathead'),
             ('25', 'Lewis and Clark'),
             ('35', 'Petroleum'),
             ('45', 'Sanders'),
             ('55', 'Wibaux'),
             ('06', 'Carter'),
             ('16', 'Gallatin'),
             ('26', 'Liberty'),
             ('36', 'Phillips'),
             ('46', 'Sheridan'),
             ('56', 'Yellowstone'),
             ('07', 'Cascade'),
             ('17', 'Garfield'),
             ('27', 'Lincoln'),
             ('37', 'Pondera'),
             ('47', 'Silver Bow'),
             ('08', 'Chouteau'),
             ('18', 'Glacier'),
             ('28', 'Madison'),
             ('38', 'Powder River'),
             ('48', 'Stillwater'),
             ('09', 'Custer'),
             ('19', 'Golden Valley'),
             ('29', 'McCone'),
             ('39', 'Powell'),
             ('49', 'Sweet Grass'),
             ('10', 'Daniels'),
             ('20', 'Granite'),
             ('30', 'Meagher'),
             ('40', 'Prairie'),
             ('50', 'Teton')) AS A (COUNTY_ID, COUNTY_NAME)
) SELECT '2023-11-06'::date                        as FILE_DATE,
       'MT'                                      as STATE_CODE,
       C.COUNTY_NAME                             as COUNTY_CODE,
       VTRID                                        VOTER_ID,
       NULL                                      AS PREFIX,
       FIRST_NAME                                AS FIRST_NAME,
       MIDDLE_NAME                               AS MIDDLE_NAME,
       LAST_NAME                                 AS LAST_NAME,
       NULL                                      AS NAME_SUFFIX,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           RA_HS_NUM,
           RA_STREET_NAME,
           RA_STTYPE,
           RA_STDIR_CODE,
           RA_STDIR_CODE_POST
           ])                                    AS RESIDENCE_ADDRESS_LINE_1,
       PUBLIC.MERGE_ADDRESS_ELEMENTS([
           RA_UTYP_CODE,
           RA_UNIT_NUM
           ])                                    AS RESIDENCE_ADDRESS_LINE_2,
       RA_CITY                                   AS RESIDENCE_ADDRESS_CITY,
       COALESCE(RA_STATE, 'MT')                  AS RESIDENCE_ADDRESS_STATE,
       RA_ZIP_CODE                               AS RESIDENCE_ADDRESS_ZIPCODE,
       'USA'                                     AS RESIDENCE_ADDRESS_COUNTRY,
       YEAR(TO_DATE(DOB, 'MM/DD/YYYY'))          AS BIRTH_YEAR,
       MONTH(TO_DATE(DOB, 'MM/DD/YYYY'))         AS BIRTH_MONTH,
       DAYOFMONTH(TO_DATE(DOB, 'MM/DD/YYYY'))    AS BIRTH_DATE,
       CASE VOTER_STATUS
           WHEN 'Active' THEN 'A'
           WHEN 'Inactive' THEN 'I'
           WHEN 'Provisional' THEN 'PROV'
           END                                   as VOTER_STATUS,
       TO_DATE(VOTE_ELIGIBLE_DATE, 'MM/DD/YYYY') AS REGISTRATION_DATE,
       NULL                                      AS LAST_VOTED_DATE,
       NULL                                      AS LAST_PARTY_VOTED,
       CONGRESS_DISTRICT                         AS CONGRESSIONAL_DISTRICT,
       SENATE_DISTRICT                           AS STATE_SENATE_DISTRICT,
       HOUSE_DISTRICT                            AS STATE_HOUSE_DISTRICT,
       NULL                                      AS JUDICIAL_DISTRICT,
       NULL                                      AS COUNTY_COMMISSION_DISTRICT,
       NULL                                      AS SCHOOL_BOARD_DISTRICT,
       NULL                                      AS CITY_COUNCIL_DISTRICT,
       PRECINCT                                  AS COUNTY_PRECINCT,
       NULL                                      AS MUNICIPAL_PRECINCT,
       NULL                                      AS RACE,
       NULL                                      AS GENDER,
       MA_ADDR_LINE_1                            AS MAILING_ADDRESS_LINE_1,
       NULL                                      AS MAILING_ADDRESS_LINE_2,
       NULL                                      AS MAILING_LINE_3,
       MA_CITY                                   AS MAILING_CITY,
       MA_STATE                                  AS MAILING_STATE,
       MA_ZIP_CODE                               AS MAILING_ZIPCODE,
       NULL                                      AS MAILING_COUNTRY
FROM RAW.MONTANA_VOTERS_2023_11_06 V
         LEFT JOIN __dbt__cte__montana_counties C ON C.COUNTY_ID = V.CURRENT_COUNTY
  );
