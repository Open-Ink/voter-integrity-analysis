SELECT '2023-11-06'::date as INPUT_FILE_DATE,
       'MT'               AS INPUT_STATE,
       C.COUNTY_NAME      AS INPUT_COUNTY,
       INPUT_VTRID        AS INPUT_VOTER_ID,
       INPUT_LASTNAME     AS INPUT_LAST_NAME,
       INPUT_FIRSTNAME    AS INPUT_FIRST_NAME,
       INPUT_MIDDLENAME   AS INPUT_MIDDLE_NAME,
       NULL               AS INPUT_SUFFIX,
       INPUT_ADDRESSLINE1 AS INPUT_ADDRESS_LINE_1,
       INPUT_ADDRESSLINE2 AS INPUT_ADDRESS_LINE_2,
       INPUT_RA_CITY      AS INPUT_RESIDENCE_CITY,
       INPUT_STATE        AS INPUT_RESIDENCE_STATE,
       INPUT_RA_ZIP_CODE  AS INPUT_RESIDENCE_ZIPCODE,
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
       V.COUNTY_NAME,
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
FROM RAW.MONTANA_NCOA_RESULTS_2023_11_06 V
         LEFT JOIN {{ ref("montana_counties") }} C ON C.COUNTY_ID = V.INPUT_CURRENT_COUNTY