{% macro import_wyoming_voters() %}

CREATE TABLE IF NOT EXISTS RAW.wyoming_voters_2023_11_14
(
    voter_id        TEXT,
    last_name       TEXT,
    first_name      TEXT,
    middle_name     TEXT,
    name_suffix     TEXT,
    details_ra_     TEXT,
    city_ra_        TEXT,
    zip_ra_         TEXT,
    county          TEXT,
    precinct        TEXT,
    split           TEXT,
    details_ma_     TEXT,
    city_ma_        TEXT,
    state_ma_       TEXT,
    zip_ma_         TEXT,
    country_ma_     TEXT,
    political_party TEXT,
    eff_reg_date    TEXT,
    senate          TEXT,
    house           TEXT
);

COPY INTO RAW.wyoming_voters_2023_11_14 FROM '@VOTER_FILES/wyoming/raw_data/file_date=2023_11_14/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

CREATE TABLE IF NOT EXISTS RAW.wyoming_ncoa_results_2023_11_14
(
    input_voter_id                      TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_address                       TEXT,
    input_city                          TEXT,
    input_zip_code                      TEXT,
    input_county                        TEXT,
    input_state                         TEXT,
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

COPY INTO RAW.wyoming_ncoa_results_2023_11_14 FROM '@VOTER_FILES/wyoming/ncoa_data/file_date=2023_11_14/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}
