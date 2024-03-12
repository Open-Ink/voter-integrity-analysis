{% macro import_connecticut_voters() %}

CREATE TABLE IF NOT EXISTS RAW.CONNECTICUT_VOTERS_2023_10_12_UNPARSED
(
    RAW_DATA TEXT
);

COPY INTO RAW.CONNECTICUT_VOTERS_2023_10_12_UNPARSED FROM '@PUBLIC.VOTER_FILES/connecticut/raw_data/file_date=2023_10_12/'
    FILE_FORMAT = ( TYPE = CSV
        RECORD_DELIMITER = '\n',
        ENCODING = 'ISO-8859-1'
        FIELD_DELIMITER = NONE )
    ON_ERROR = 'ABORT_STATEMENT';


CREATE TABLE IF NOT EXISTS RAW.connecticut_ncoa_results_2023_10_12
(
    input_id                            TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
    input_suffix                        TEXT,
    input_address_line_1                TEXT,
    input_address_line_2                TEXT,
    input_town_name                     TEXT,
    input_state                         TEXT,
    input_zipcode5                      TEXT,
    input_zipcode4                      TEXT,
    household_position                  TEXT,
    name_id                             TEXT,
    individual_record_id                TEXT,
    first_name                          TEXT,
    last_name                           TEXT,
    company_name                        TEXT,
    street_number                       TEXT,
    street_pre_direction                TEXT,
    street_name                         TEXT,
    street_post_direction               TEXT,
    street_suffix                       TEXT,
    unit_type                           TEXT,
    unit_number                         TEXT,
    box_number                          TEXT,
    city_name                           TEXT,
    state_code                          TEXT,
    postal_code                         TEXT,
    postal_code_extension               TEXT,
    carrier_route                       TEXT,
    address_status                      TEXT,
    error_number                        TEXT,
    address_type                        TEXT,
    delivery_point                      TEXT,
    check_digit                         TEXT,
    delivery_point_verification         TEXT,
    delivery_point_verification_notes   TEXT,
    vacant                              TEXT,
    congressional_district_code         TEXT,
    area_code                           TEXT,
    latitude                            TEXT,
    longitude                           TEXT,
    time_zone                           TEXT,
    county_name                         TEXT,
    county_fips                         TEXT,
    state_fips                          TEXT,
    barcode                             TEXT,
    locatable_address_conversion_system TEXT,
    line_of_travel                      TEXT,
    ascending_or_descending             TEXT,
    move_applied                        TEXT,
    move_type                           TEXT,
    move_date                           TEXT,
    move_distance                       TEXT,
    match_flag                          TEXT,
    nxi                                 TEXT,
    ank                                 TEXT,
    residential_delivery_indicator      TEXT,
    record_type                         TEXT,
    country_code                        TEXT,
    address_line_1                      TEXT,
    address_line_2                      TEXT,
    address_id                          TEXT,
    household_id                        TEXT,
    individual_id                       TEXT
);

COPY INTO RAW.connecticut_ncoa_results_2023_10_12 FROM '@VOTER_FILES/connecticut/ncoa_data/file_date=2023_10_12/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}