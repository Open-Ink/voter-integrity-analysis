{% macro add_table_to_ncoa_results(table_name) %}

SELECT INPUT_FILE_DATE,
       INPUT_STATE,
       INPUT_COUNTY,
       INPUT_VOTER_ID,
       INPUT_LAST_NAME,
       INPUT_FIRST_NAME,
       INPUT_MIDDLE_NAME,
       INPUT_SUFFIX,
       INPUT_ADDRESS_LINE_1,
       INPUT_ADDRESS_LINE_2,
       INPUT_RESIDENCE_CITY,
       INPUT_RESIDENCE_STATE,
       INPUT_RESIDENCE_ZIPCODE,
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
       TO_DATE(MOVE_DATE, 'YYYYMM') AS MOVE_DATE,
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
       INDIVIDUAL_ID,
       CURRENT_TIMESTAMP AS CREATED_AT
FROM {{ table_name }} T1
    {% if is_incremental() %}
WHERE NOT EXISTS (SELECT 1
                  FROM {{ this }} T2
                  WHERE T1.INPUT_FILE_DATE = T2.INPUT_FILE_DATE
                    AND T1.INPUT_STATE = T2.INPUT_STATE)
{% endif %}


{% endmacro %}