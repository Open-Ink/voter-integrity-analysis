{% macro import_michigan_voters() %}

CREATE TABLE IF NOT EXISTS RAW.michigan_voters_2023_11_21
(
    last_name                         TEXT,
    first_name                        TEXT,
    middle_name                       TEXT,
    name_suffix                       TEXT,
    year_of_birth                     TEXT,
    gender                            TEXT,
    registration_date                 TEXT,
    street_number_prefix              TEXT,
    street_number                     TEXT,
    street_number_suffix              TEXT,
    direction_prefix                  TEXT,
    street_name                       TEXT,
    street_type                       TEXT,
    direction_suffix                  TEXT,
    extension                         TEXT,
    city                              TEXT,
    state                             TEXT,
    zip_code                          TEXT,
    mailing_address_line_one          TEXT,
    mailing_address_line_two          TEXT,
    mailing_address_line_three        TEXT,
    mailing_address_line_four         TEXT,
    mailing_address_line_five         TEXT,
    voter_identification_number       TEXT,
    county_code                       TEXT,
    county_name                       TEXT,
    jurisdiction_code                 TEXT,
    jurisdiction_name                 TEXT,
    precinct                          TEXT,
    ward                              TEXT,
    school_district_code              TEXT,
    school_district_name              TEXT,
    state_house_district_code         TEXT,
    state_house_district_name         TEXT,
    state_senate_district_code        TEXT,
    state_senate_district_name        TEXT,
    us_congress_district_code         TEXT,
    us_congress_district_name         TEXT,
    county_commissioner_district_code TEXT,
    county_commissioner_district_name TEXT,
    village_district_code             TEXT,
    village_district_name             TEXT,
    village_precinct                  TEXT,
    school_precinct                   TEXT,
    is_permanent_absentee_voter       TEXT,
    voter_status_type_code            TEXT,
    uocava_status_code                TEXT,
    uocava_status_name                TEXT
);

CREATE TABLE IF NOT EXISTS RAW.michigan_ncoa_data_2023_11_21
(
    input_id                            TEXT,
    input_file_date                     TEXT,
    input_county_name                   TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
    input_name_suffix                   TEXT,
    input_line1                         TEXT,
    input_line2                         TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zip_code                      TEXT,
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

CREATE TABLE IF NOT EXISTS RAW.michigan_voter_history_2023_11_21
(
    voter_identification_number TEXT,
    county_code                 TEXT,
    county_name                 TEXT,
    jurisdiction_code           TEXT,
    jurisdiction_name           TEXT,
    school_district_code        TEXT,
    school_district_name        TEXT,
    election_date               TEXT,
    voting_type                 TEXT
);

COPY INTO RAW.michigan_voters_2023_11_21
    FROM @VOTER_FILES/michigan/raw_data/file_date=2023-11-21/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', ''), REPLACE_INVALID_CHARACTERS = TRUE
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.michigan_ncoa_data_2023_11_21
    FROM @VOTER_FILES/michigan/ncoa_data/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', ''), REPLACE_INVALID_CHARACTERS = TRUE
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.michigan_voter_history_2023_11_21
    FROM @VOTER_FILES/michigan/voter_history/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}