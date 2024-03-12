{% macro import_oklahoma_voters() %}


CREATE TABLE IF NOT EXISTS RAW.oklahoma_voters_2023_09_23
(
    precinct               TEXT,
    last_name              TEXT,
    first_name             TEXT,
    middle_name            TEXT,
    suffix                 TEXT,
    voter_id               TEXT,
    polital_aff            TEXT,
    status                 TEXT,
    street_num             TEXT,
    street_dir             TEXT,
    street_name            TEXT,
    street_type            TEXT,
    street_post_dir        TEXT,
    bldg_num               TEXT,
    city                   TEXT,
    zip                    TEXT,
    date_of_birth          TEXT,
    registration_date      TEXT,
    mail_street1           TEXT,
    mail_street2           TEXT,
    mail_city              TEXT,
    mail_state             TEXT,
    mail_zip               TEXT,
    muni                   TEXT,
    muni_sub               TEXT,
    school                 TEXT,
    school_sub             TEXT,
    tech_center            TEXT,
    tech_center_sub        TEXT,
    county_comm            TEXT,
    voter_hist1            TEXT,
    hist_method1           TEXT,
    voter_hist2            TEXT,
    hist_method2           TEXT,
    voter_hist3            TEXT,
    hist_method3           TEXT,
    voter_hist4            TEXT,
    hist_method4           TEXT,
    voter_hist5            TEXT,
    hist_method5           TEXT,
    voter_hist6            TEXT,
    hist_method6           TEXT,
    voter_hist7            TEXT,
    hist_method7           TEXT,
    voter_hist8            TEXT,
    hist_method8           TEXT,
    voter_hist9            TEXT,
    hist_method9           TEXT,
    voter_hist10           TEXT,
    hist_method10          TEXT,
    county_desc            TEXT,
    returned_undeliverable TEXT
);

COPY INTO RAW.oklahoma_voters_2023_09_23 FROM '@VOTER_FILES/oklahoma/raw_data/file_date=2023_09_23/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', ''), ENCODING = 'ISO-8859-1'
        )
    ON_ERROR = 'CONTINUE';


CREATE TABLE IF NOT EXISTS RAW.oklahoma_ncoa_results_2023_09_23
(
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_voter_id                      TEXT,
    input_address_line_1                TEXT,
    input_address_line_2                TEXT,
    input_city                          TEXT,
    input_zip_code5                     TEXT,
    input_zip_code4                     TEXT,
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

COPY INTO RAW.oklahoma_ncoa_results_2023_09_23 FROM '@VOTER_FILES/oklahoma/ncoa_data/file_date=2023_09_23/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

CREATE TABLE IF NOT EXISTS RAW.oklahoma_voter_history_2023_09_23
(
    Voter_ID      TEXT,
    Election_Date TEXT,
    Voting_Method TEXT
);

COPY INTO RAW.oklahoma_voter_history_2023_09_23 FROM '@VOTER_FILES/oklahoma/voter_history/file_date=2023_09_23/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', ''), ENCODING = 'ISO-8859-1'
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}
