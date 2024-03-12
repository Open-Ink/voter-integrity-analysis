with __dbt__cte__tennessee_counties as (


SELECT *
FROM (VALUES ('01', 'ANDERSON', '1'),
             ('02', 'BEDFORD', '2'),
             ('08', 'CANNON', '8'),
             ('03', 'BENTON', '3'),
             ('04', 'BLEDSOE', '4'),
             ('06', 'BRADLEY', '6'),
             ('05', 'BLOUNT', '5'),
             ('07', 'CAMPBELL', '7'),
             ('09', 'CARROLL', '9'),
             ('10', 'CARTER', '10'),
             ('11', 'CHEATHAM', '11'),
             ('12', 'CHESTER', '12'),
             ('13', 'CLAIBORNE', '13'),
             ('14', 'CLAY', '14'),
             ('15', 'COCKE', '15'),
             ('16', 'COFFEE', '16'),
             ('17', 'CROCKETT', '17'),
             ('19', 'DAVIDSON', '19'),
             ('18', 'CUMBERLAND', '18'),
             ('20', 'DECATUR', '20'),
             ('21', 'DEKALB', '21'),
             ('22', 'DICKSON', '22'),
             ('23', 'DYER', '23'),
             ('24', 'FAYETTE', '24'),
             ('25', 'FENTRESS', '25'),
             ('26', 'FRANKLIN', '26'),
             ('27', 'GIBSON', '27'),
             ('28', 'GILES', '28'),
             ('37', 'HAWKINS', '37'),
             ('36', 'HARDIN', '36'),
             ('29', 'GRAINGER', '29'),
             ('35', 'HARDEMAN', '35'),
             ('38', 'HAYWOOD', '38'),
             ('34', 'HANCOCK', '34'),
             ('33', 'HAMILTON', '33'),
             ('32', 'HAMBLEN', '32'),
             ('31', 'GRUNDY', '31'),
             ('30', 'GREENE', '30'),
             ('42', 'HOUSTON', '42'),
             ('43', 'HUMPHREYS', '43'),
             ('39', 'HENDERSON', '39'),
             ('40', 'HENRY', '40'),
             ('44', 'JACKSON', '44'),
             ('41', 'HICKMAN', '41'),
             ('45', 'JEFFERSON', '45'),
             ('46', 'JOHNSON', '46'),
             ('47', 'KNOX', '47'),
             ('53', 'LOUDON', '53'),
             ('52', 'LINCOLN', '52'),
             ('51', 'LEWIS', '51'),
             ('48', 'LAKE', '48'),
             ('50', 'LAWRENCE', '50'),
             ('54', 'MCMINN', '54'),
             ('49', 'LAUDERDALE', '49'),
             ('70', 'POLK', '70'),
             ('69', 'PICKETT', '69'),
             ('68', 'PERRY', '68'),
             ('67', 'OVERTON', '67'),
             ('66', 'OBION', '66'),
             ('64', 'MOORE', '64'),
             ('63', 'MONTGOMERY', '63'),
             ('71', 'PUTNAM', '71'),
             ('56', 'MACON', '56'),
             ('62', 'MONROE', '62'),
             ('61', 'MEIGS', '61'),
             ('55', 'MCNAIRY', '55'),
             ('60', 'MAURY', '60'),
             ('65', 'MORGAN', '65'),
             ('59', 'MARSHALL', '59'),
             ('58', 'MARION', '58'),
             ('57', 'MADISON', '57'),
             ('72', 'RHEA', '72'),
             ('74', 'ROBERTSON', '74'),
             ('75', 'RUTHERFORD', '75'),
             ('73', 'ROANE', '73'),
             ('76', 'SCOTT', '76'),
             ('77', 'SEQUATCHIE', '77'),
             ('88', 'VAN BUREN', '88'),
             ('89', 'WARREN', '89'),
             ('87', 'UNION', '87'),
             ('86', 'UNICOI', '86'),
             ('85', 'TROUSDALE', '85'),
             ('84', 'TIPTON', '84'),
             ('78', 'SEVIER', '78'),
             ('83', 'SUMNER', '83'),
             ('82', 'SULLIVAN', '82'),
             ('81', 'STEWART', '81'),
             ('79', 'SHELBY', '79'),
             ('80', 'SMITH', '80'),
             ('90', 'WASHINGTON', '90'),
             ('94', 'WILLIAMSON', '94'),
             ('93', 'WHITE', '93'),
             ('95', 'WILSON', '95'),
             ('91', 'WAYNE', '91'),
             ('92', 'WEAKLEY', '92')) AS A (COUNTY_ID, COUNTY_NAME, COUNTY_ID_INT)
) SELECT '2024-01-01'::date  as INPUT_FILE_DATE,
       'TN'                AS INPUT_STATE,
       C.COUNTY_NAME        AS INPUT_COUNTY,
       INPUT_VOTER_ID      AS INPUT_VOTER_ID,
       INPUT_LAST_NAME     AS INPUT_LAST_NAME,
       INPUT_FIRST_NAME    AS INPUT_FIRST_NAME,
       INPUT_MIDDLE_NAME   AS INPUT_MIDDLE_NAME,
       INPUT_NAME_SUFFIX   AS INPUT_SUFFIX,
       INPUT_ADDRESS_LINE1 AS INPUT_ADDRESS_LINE_1,
       INPUT_ADDRESS_LINE2 AS INPUT_ADDRESS_LINE_2,
       INPUT_CITY          AS INPUT_RESIDENCE_CITY,
       INPUT_STATE         AS INPUT_RESIDENCE_STATE,
       INPUT_ZIP_CODE5     AS INPUT_RESIDENCE_ZIPCODE,
       HOUSEHOLD_POSITION,
       NAME_ID,
       INDIVIDUAL_RECORD_ID,
       FIRST_NAME,
       LAST_NAME,
       COMPANY_NAME,
       STREET_NUMBER,
       STREET_PRE_DIRECTION,
       STREET_NAME,
       STREET_POST_DIRECTION,
       STREET_SUFFIX,
       UNIT_TYPE,
       UNIT_NUMBER,
       BOX_NUMBER,
       CITY_NAME,
       STATE_CODE,
       POSTAL_CODE,
       POSTAL_CODE_EXTENSION,
       CARRIER_ROUTE,
       ADDRESS_STATUS,
       ERROR_NUMBER,
       ADDRESS_TYPE,
       DELIVERY_POINT,
       CHECK_DIGIT,
       DELIVERY_POINT_VERIFICATION,
       DELIVERY_POINT_VERIFICATION_NOTES,
       VACANT,
       CONGRESSIONAL_DISTRICT_CODE,
       AREA_CODE,
       LATITUDE,
       LONGITUDE,
       TIME_ZONE,
       NCOA.COUNTY_NAME,
       COUNTY_FIPS,
       STATE_FIPS,
       BARCODE,
       LOCATABLE_ADDRESS_CONVERSION_SYSTEM,
       LINE_OF_TRAVEL,
       ASCENDING_OR_DESCENDING,
       MOVE_APPLIED,
       MOVE_TYPE,
       MOVE_DATE,
       MOVE_DISTANCE,
       MATCH_FLAG,
       NXI,
       ANK,
       RESIDENTIAL_DELIVERY_INDICATOR,
       RECORD_TYPE,
       COUNTRY_CODE,
       ADDRESS_LINE_1,
       ADDRESS_LINE_2,
       ADDRESS_ID,
       HOUSEHOLD_ID,
       INDIVIDUAL_ID
FROM RAW.TENNESSEE_NCOA_RESULTS_2024_01_01 NCOA
            INNER JOIN __dbt__cte__tennessee_counties C ON NCOA.INPUT_COUNTY = C.COUNTY_ID