{% macro import_washington_voters() %}

CREATE TABLE IF NOT EXISTS RAW.washington_voters_2023_09_01
(
    state_voter_id         TEXT,
    f_name                 TEXT,
    m_name                 TEXT,
    l_name                 TEXT,
    name_suffix            TEXT,
    birthyear              TEXT,
    gender                 TEXT,
    reg_st_num             TEXT,
    reg_st_frac            TEXT,
    reg_st_name            TEXT,
    reg_st_type            TEXT,
    reg_unit_type          TEXT,
    reg_st_pre_direction   TEXT,
    reg_st_post_direction  TEXT,
    reg_st_unit_num        TEXT,
    reg_city               TEXT,
    reg_state              TEXT,
    reg_zip_code           TEXT,
    county_code            TEXT,
    precinct_code          TEXT,
    precinct_part          TEXT,
    legislative_district   TEXT,
    congressional_district TEXT,
    mail1                  TEXT,
    mail2                  TEXT,
    mail3                  TEXT,
    mail4                  TEXT,
    mail_city              TEXT,
    mail_zip               TEXT,
    mail_state             TEXT,
    mail_country           TEXT,
    registrationdate       TEXT,
    absentee_type          TEXT,
    last_voted             TEXT,
    status_code            TEXT
);

COPY INTO RAW.washington_voters_2023_09_01 FROM '@VOTER_FILES/washington/raw_data/file_date=2023_09_01/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '|',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        REPLACE_INVALID_CHARACTERS = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';


CREATE TABLE IF NOT EXISTS RAW.washington_ncoa_results_2023_09_01
(
    input_voter_id                      TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
    input_name_suffix                   TEXT,
    input_address_line1                 TEXT,
    input_address_line2                 TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zip_code                      TEXT,
    input_county_code                   TEXT,
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

COPY INTO RAW.washington_ncoa_results_2023_09_01 FROM '@VOTER_FILES/washington/ncoa_data/file_date=2023_09_01/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

CREATE TABLE IF NOT EXISTS RAW.washington_voter_history_2023_09_01
(
    CountyCode     TEXT,
    StateVoterID   TEXT,
    ElectionDate   TEXT,
    VoterHistoryID TEXT
);

COPY INTO RAW.washington_voter_history_2023_09_01 FROM '@VOTER_FILES/washington/voter_history/file_date=2023_09_01/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        REPLACE_INVALID_CHARACTERS = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}
