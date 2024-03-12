SELECT '2023-10-12'::date        as INPUT_FILE_DATE,
       'CT'                      AS INPUT_STATE,
       T.COUNTY_NAME             AS INPUT_COUNTY,
       NCOA.INPUT_ID             AS INPUT_VOTER_ID,
       NCOA.INPUT_LAST_NAME      AS INPUT_LAST_NAME,
       NCOA.INPUT_FIRST_NAME     AS INPUT_FIRST_NAME,
       NCOA.INPUT_MIDDLE_NAME    AS INPUT_MIDDLE_NAME,
       NCOA.INPUT_SUFFIX         AS INPUT_SUFFIX,
       NCOA.INPUT_ADDRESS_LINE_1 AS INPUT_ADDRESS_LINE_1,
       NCOA.INPUT_ADDRESS_LINE_2 AS INPUT_ADDRESS_LINE_2,
       NCOA.INPUT_TOWN_NAME      AS INPUT_RESIDENCE_CITY,
       NCOA.INPUT_STATE          AS INPUT_RESIDENCE_STATE,
       NCOA.INPUT_ZIPCODE5       AS INPUT_RESIDENCE_ZIPCODE,
       NCOA.HOUSEHOLD_POSITION,
       NCOA.NAME_ID,
       NCOA.INDIVIDUAL_RECORD_ID,
       NCOA.FIRST_NAME,
       NCOA.LAST_NAME,
       NCOA.COMPANY_NAME,
       NCOA.STREET_NUMBER,
       NCOA.STREET_PRE_DIRECTION,
       NCOA.STREET_NAME,
       NCOA.STREET_POST_DIRECTION,
       NCOA.STREET_SUFFIX,
       NCOA.UNIT_TYPE,
       NCOA.UNIT_NUMBER,
       NCOA.BOX_NUMBER,
       NCOA.CITY_NAME,
       NCOA.STATE_CODE,
       NCOA.POSTAL_CODE,
       NCOA.POSTAL_CODE_EXTENSION,
       NCOA.CARRIER_ROUTE,
       NCOA.ADDRESS_STATUS,
       NCOA.ERROR_NUMBER,
       NCOA.ADDRESS_TYPE,
       NCOA.DELIVERY_POINT,
       NCOA.CHECK_DIGIT,
       NCOA.DELIVERY_POINT_VERIFICATION,
       NCOA.DELIVERY_POINT_VERIFICATION_NOTES,
       NCOA.VACANT,
       NCOA.CONGRESSIONAL_DISTRICT_CODE,
       NCOA.AREA_CODE,
       NCOA.LATITUDE,
       NCOA.LONGITUDE,
       NCOA.TIME_ZONE,
       NCOA.COUNTY_NAME,
       NCOA.COUNTY_FIPS,
       NCOA.STATE_FIPS,
       NCOA.BARCODE,
       NCOA.LOCATABLE_ADDRESS_CONVERSION_SYSTEM,
       NCOA.LINE_OF_TRAVEL,
       NCOA.ASCENDING_OR_DESCENDING,
       NCOA.MOVE_APPLIED,
       NCOA.MOVE_TYPE,
       NCOA.MOVE_DATE,
       NCOA.MOVE_DISTANCE,
       NCOA.MATCH_FLAG,
       NCOA.NXI,
       NCOA.ANK,
       NCOA.RESIDENTIAL_DELIVERY_INDICATOR,
       NCOA.RECORD_TYPE,
       NCOA.COUNTRY_CODE,
       NCOA.ADDRESS_LINE_1,
       NCOA.ADDRESS_LINE_2,
       NCOA.ADDRESS_ID,
       NCOA.HOUSEHOLD_ID,
       NCOA.INDIVIDUAL_ID
FROM RAW.CONNECTICUT_NCOA_RESULTS_2023_10_12 NCOA
         INNER JOIN DBT_VOTER_DATA.raw.connecticut_voters_2023_10_12 V ON NCOA.INPUT_ID = V.WS_ID_VOTER
         INNER JOIN DBT_VOTER_DATA.cleaned.connecticut_towns T ON V.WS_TOWN_ID = T.TOWN_ID
WHERE TRY_TO_DATE(V.WS_DT_ACCEPT, 'MM/DD/YYYY') IS NOT NULL