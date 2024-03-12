{% macro import_nevada_voters() %}

CREATE TABLE IF NOT EXISTS RAW.nevada_voters_2023_07_31
(
    voter_id               TEXT,
    residential_county     TEXT,
    first_name             TEXT,
    middle_name            TEXT,
    last_name              TEXT,
    suffix                 TEXT,
    birth_date             TEXT,
    registration_date      TEXT,
    residential_address_1  TEXT,
    residential_address_2  TEXT,
    residential_city       TEXT,
    residential_state      TEXT,
    residential_zip        TEXT,
    phone                  TEXT,
    party                  TEXT,
    congressional_district TEXT,
    senate_district        TEXT,
    assembly_district      TEXT,
    education_district     TEXT,
    regent_district        TEXT,
    registered_precinct    TEXT,
    county_status          TEXT,
    county_voter_id        TEXT,
    id_required            TEXT
);

CREATE TABLE IF NOT EXISTS RAW.nevada_ncoa_results_2023_07_31
(
    input_voter_id                       TEXT,
    input_residential_county            TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
    input_suffix                        TEXT,
    input_birth_date                    TEXT,
    input_registration_date             TEXT,
    input_residential_address_1         TEXT,
    input_residential_address_2         TEXT,
    input_residential_city              TEXT,
    input_residential_state             TEXT,
    input_residential_zip               TEXT,
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

COPY INTO RAW.nevada_voters_2023_07_31
    FROM @VOTER_FILES/nevada/raw_data/file_date=2023_07_31/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

CREATE TABLE IF NOT EXISTS RAW.nevada_voter_history_2023_07_31
(
    voting_history_id TEXT,
    voter_id         TEXT,
    election_date   TEXT,
    vote_code       TEXT
);

COPY INTO RAW.nevada_ncoa_results_2023_07_31
    FROM @VOTER_FILES/nevada/ncoa_data/file_date=2023_07_31/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.nevada_voter_history_2023_07_31
    FROM @VOTER_FILES/nevada/voter_history/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}