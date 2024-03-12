{% macro import_utah_voters() %}


CREATE TABLE IF NOT EXISTS RAW.utah_voters_2023_11_06
(
    voter_id                    TEXT,
    privacy_status              TEXT,
    last_name                   TEXT,
    first_name                  TEXT,
    middle_name                 TEXT,
    suffix                      TEXT,
    voter_status                TEXT,
    last_updated                TEXT,
    party                       TEXT,
    mailing_address             TEXT,
    mailing_city                TEXT,
    county                      TEXT,
    fips                        TEXT,
    precinct                    TEXT,
    house_number                TEXT,
    house_number_suffix         TEXT,
    street_direction_prefix     TEXT,
    street                      TEXT,
    street_direction_suffix     TEXT,
    street_type                 TEXT,
    unit_type                   TEXT,
    unit_number                 TEXT,
    city                        TEXT,
    zip                         TEXT,
    congressional_district      TEXT,
    state_house_district        TEXT,
    state_senate_district       TEXT,
    state_school_board_district TEXT,
    local_school_board_district TEXT,
    county_council_district     TEXT,
    city_council_district       TEXT
);

COPY INTO RAW.utah_voters_2023_11_06 FROM '@VOTER_FILES/utah/raw_data/file_date=2023_11_06/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'CONTINUE';


CREATE TABLE IF NOT EXISTS RAW.utah_ncoa_results_2023_11_06
(
    input_voter_id                      TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_county                        TEXT,
    input_fips                          TEXT,
    input_city                          TEXT,
    input_zip                           TEXT,
    input_state                         TEXT,
    input_address_line_1                TEXT,
    input_address_line_2                TEXT,
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

COPY INTO RAW.utah_ncoa_results_2023_11_06 FROM '@VOTER_FILES/utah/ncoa_data/file_date=2023_11_06/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

CREATE TABLE IF NOT EXISTS RAW.utah_voter_history_2023_11_06
(
    Voter_ID               TEXT,
    Voter_Name             TEXT,
    Voter_Status           TEXT,
    Current_Voter_Precinct TEXT,
    election_11_21_2023    TEXT,
    election_09_05_2023    TEXT,
    election_11_08_2022    TEXT,
    election_06_28_2022    TEXT,
    election_11_02_2021    TEXT,
    election_08_10_2021    TEXT,
    election_11_03_2020    TEXT,
    election_06_30_2020    TEXT,
    election_03_03_2020    TEXT,
    election_11_05_2019    TEXT,
    election_08_13_2019    TEXT,
    election_11_06_2018    TEXT,
    election_06_26_2018    TEXT,
    election_11_07_2017    TEXT,
    election_08_15_2017    TEXT,
    election_11_08_2016    TEXT,
    election_06_28_2016    TEXT,
    DUP                    TEXT
);

COPY INTO RAW.utah_voter_history_2023_11_06 FROM '@VOTER_FILES/utah/voter_history/file_date=2023_11_06/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'CONTINUE'


{% endmacro %}
