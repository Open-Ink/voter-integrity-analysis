{% macro import_florida_voters() %}

CREATE TABLE IF NOT EXISTS RAW.FLORIDA_VOTERS_2023_08_08
(
    COUNTY                     VARCHAR,
    VOTER_ID                   VARCHAR,
    LAST_NAME                  VARCHAR,
    NAME_SUFFIX                VARCHAR,
    FIRST_NAME                 VARCHAR,
    MIDDLE_NAME                VARCHAR,
    HAS_REQUESTED_EXEMPTION    VARCHAR,
    ADDRESS_LINE_1             VARCHAR,
    ADDRESS_LINE_2             VARCHAR,
    ADDRESS_CITY               VARCHAR,
    ADDRESS_STATE              VARCHAR,
    ADDRESS_ZIPCODE            VARCHAR,
    MAILING_ADDRESS_LINE_1     VARCHAR,
    MAILING_ADDRESS_LINE_2     VARCHAR,
    MAILING_ADDRESS_LINE_3     VARCHAR,
    MAILING_ADDRESS_CITY       VARCHAR,
    MAILING_ADDRESS_STATE      VARCHAR,
    MAILING_ADDRESS_ZIPCODE    VARCHAR,
    MAILING_ADDRESS_COUNTRY    VARCHAR,
    GENDER                     VARCHAR,
    RACE                       VARCHAR,
    BIRTH_DATE                 VARCHAR,
    REGISTRATION_DATE          VARCHAR,
    PARTY_AFFILIATION          VARCHAR,
    PRECINCT                   VARCHAR,
    PRECINCT_GROUP             VARCHAR,
    PRECINCT_SPLIT             VARCHAR,
    PRECINCT_SUFFIX            VARCHAR,
    VOTER_STATUS               VARCHAR,
    CONGRESSIONAL_DISTRICT     VARCHAR,
    HOUSE_DISTRICT             VARCHAR,
    SENATE_DISTRICT            VARCHAR,
    COUNTY_COMMISSION_DISTRICT VARCHAR,
    SCHOOL_BOARD_DISTRICT      VARCHAR,
    DAYTIME_AREA_CODE          VARCHAR,
    DAYTIME_PHONE_NUMBER       VARCHAR,
    DAYTIME_PHONE_EXTENSION    VARCHAR,
    EMAIL_ADDRESS              VARCHAR
);

CREATE TABLE IF NOT EXISTS RAW.FLORIDA_NCOA_RESULT_2023_08_08
(
    INPUT_FILE_DATE                     VARCHAR,
    INPUT_COUNTY                        VARCHAR,
    INPUT_VOTER_ID                      VARCHAR,
    INPUT_LAST_NAME                     VARCHAR,
    INPUT_FIRST_NAME                    VARCHAR,
    INPUT_MIDDLE_NAME                   VARCHAR,
    INPUT_NAME_SUFFIX                   VARCHAR,
    INPUT_ADDRESS_LINE_1                VARCHAR,
    INPUT_ADDRESS_LINE_2                VARCHAR,
    INPUT_ADDRESS_CITY                  VARCHAR,
    INPUT_ADDRESS_STATE                 VARCHAR,
    INPUT_ADDRESS_ZIPCODE               VARCHAR,
    HOUSEHOLD_POSITION                  VARCHAR,
    NAME_ID                             VARCHAR,
    INDIVIDUAL_RECORD_ID                VARCHAR,
    FIRST_NAME                          VARCHAR,
    LAST_NAME                           VARCHAR,
    COMPANY_NAME                        VARCHAR,
    STREET_NUMBER                       VARCHAR,
    STREET_PRE_DIRECTION                VARCHAR,
    STREET_NAME                         VARCHAR,
    STREET_POST_DIRECTION               VARCHAR,
    STREET_SUFFIX                       VARCHAR,
    UNIT_TYPE                           VARCHAR,
    UNIT_NUMBER                         VARCHAR,
    BOX_NUMBER                          VARCHAR,
    CITY_NAME                           VARCHAR,
    STATE_CODE                          VARCHAR,
    POSTAL_CODE                         VARCHAR,
    POSTAL_CODE_EXTENSION               VARCHAR,
    CARRIER_ROUTE                       VARCHAR,
    ADDRESS_STATUS                      VARCHAR,
    ERROR_NUMBER                        VARCHAR,
    ADDRESS_TYPE                        VARCHAR,
    DELIVERY_POINT                      VARCHAR,
    CHECK_DIGIT                         VARCHAR,
    DELIVERY_POINT_VERIFICATION         VARCHAR,
    DELIVERY_POINT_VERIFICATION_NOTES   VARCHAR,
    VACANT                              VARCHAR,
    CONGRESSIONAL_DISTRICT_CODE         VARCHAR,
    AREA_CODE                           VARCHAR,
    LATITUDE                            VARCHAR,
    LONGITUDE                           VARCHAR,
    TIME_ZONE                           VARCHAR,
    COUNTY_NAME                         VARCHAR,
    COUNTY_FIPS                         VARCHAR,
    STATE_FIPS                          VARCHAR,
    BARCODE                             VARCHAR,
    LOCATABLE_ADDRESS_CONVERSION_SYSTEM VARCHAR,
    LINE_OF_TRAVEL                      VARCHAR,
    ASCENDING_OR_DESCENDING             VARCHAR,
    MOVE_APPLIED                        VARCHAR,
    MOVE_TYPE                           VARCHAR,
    MOVE_DATE                           VARCHAR,
    MOVE_DISTANCE                       VARCHAR,
    MATCH_FLAG                          VARCHAR,
    NXI                                 VARCHAR,
    ANK                                 VARCHAR,
    RESIDENTIAL_DELIVERY_INDICATOR      VARCHAR,
    RECORD_TYPE                         VARCHAR,
    COUNTRY_CODE                        VARCHAR,
    ADDRESS_LINE_1                      VARCHAR,
    ADDRESS_LINE_2                      VARCHAR,
    ADDRESS_ID                          VARCHAR,
    HOUSEHOLD_ID                        VARCHAR,
    INDIVIDUAL_ID                       VARCHAR
);

CREATE TABLE IF NOT EXISTS RAW.FLORIDA_VOTER_HISTORY_2023_08_08
(
    COUNTY_CODE   VARCHAR,
    VOTER_ID      VARCHAR,
    ELECTION_DATE VARCHAR,
    ELECTION_TYPE VARCHAR,
    HISTORY_CODE  VARCHAR
);

COPY INTO RAW.FLORIDA_VOTERS_2023_08_08
    FROM @VOTER_FILES/florida/raw_data/file_date=2023_08_08/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE, REPLACE_INVALID_CHARACTERS = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.FLORIDA_NCOA_RESULT_2023_08_08
    FROM @VOTER_FILES/florida/ncoa_data/file_date=2023_08_08/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE, REPLACE_INVALID_CHARACTERS = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.FLORIDA_VOTER_HISTORY_2023_08_08
    FROM @VOTER_FILES/florida/voter_history/file_date=2023_08_08/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE, REPLACE_INVALID_CHARACTERS = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}