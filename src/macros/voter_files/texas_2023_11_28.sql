{% macro import_texas_voters() %}

CREATE TABLE IF NOT EXISTS RAW.texas_processed_data_2023_11_28
(
    county_code             TEXT,
    precinct                TEXT,
    vuid                    TEXT,
    lastname                TEXT,
    first_name              TEXT,
    middle_name             TEXT,
    former_last_name        TEXT,
    suffix                  TEXT,
    gender                  TEXT,
    dob                     TEXT,
    perm_house_number       TEXT,
    perm_designator         TEXT,
    perm_directional_prefix TEXT,
    perm_street_name        TEXT,
    perm_street_type        TEXT,
    perm_directional_suffix TEXT,
    perm_unit_number        TEXT,
    perm_unit_type          TEXT,
    perm_city               TEXT,
    perm_zip_code           TEXT,
    mailing_address_1       TEXT,
    mailing_address_2       TEXT,
    mailing_city            TEXT,
    mailing_state           TEXT,
    mailing_zipcode         TEXT,
    date_of_registration    TEXT,
    status_code             TEXT,
    hispanic_surname_flag   TEXT
);

CREATE TABLE IF NOT EXISTS RAW.texas_ncoa_results_2023_11_28
(
    input_id                            TEXT,
    input_firstname                     TEXT,
    input_middlename                    TEXT,
    input_lastname                      TEXT,
    input_suffix                        TEXT,
    input_addressline1                  TEXT,
    input_addressline2                  TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zipcode                       TEXT,
    input_county                        TEXT,
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

COPY INTO RAW.texas_processed_data_2023_11_28
    FROM @VOTER_FILES/texas/processed_data/file_date=2023_11_28/Voters.csv
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'CONTINUE';

COPY INTO RAW.texas_ncoa_results_2023_11_28
    FROM @VOTER_FILES/texas/ncoa_results/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}