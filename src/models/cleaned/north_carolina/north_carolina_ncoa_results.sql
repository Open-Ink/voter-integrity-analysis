WITH COUNTIES AS (SELECT DISTINCT COUNTY_ID, COUNTY_DESC
                  FROM RAW.NORTH_CAROLINA_VOTERS_2023_07_21)
SELECT '2023-09-25'::date       as INPUT_FILE_DATE,
       'NC'                     AS INPUT_STATE,
       COUNTIES.COUNTY_DESC     AS INPUT_COUNTY,
       INPUT_VOTER_REG_NUM      AS INPUT_VOTER_ID,
       INPUT_LAST_NAME          AS INPUT_LAST_NAME,
       INPUT_FIRST_NAME         AS INPUT_FIRST_NAME,
       INPUT_MIDDLE_NAME        AS INPUT_MIDDLE_NAME,
       INPUT_NAME_SUFFIX_LBL    AS INPUT_SUFFIX,
       INPUT_RES_STREET_ADDRESS AS INPUT_ADDRESS_LINE_1,
       NULL                     AS INPUT_ADDRESS_LINE_2,
       INPUT_RES_CITY_DESC      AS INPUT_RESIDENCE_CITY,
       INPUT_STATE              AS INPUT_RESIDENCE_STATE,
       INPUT_ZIP_CODE           AS INPUT_RESIDENCE_ZIPCODE,
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
       COUNTY_NAME,
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
FROM RAW.NORTH_CAROLINA_NCOA_RESULTS_2023_07_21 NCOA
         INNER JOIN COUNTIES ON NCOA.INPUT_COUNTY_ID = COUNTIES.COUNTY_ID

