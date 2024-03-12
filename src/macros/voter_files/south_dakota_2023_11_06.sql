{% macro import_south_dakota_voters() %}


CREATE TABLE IF NOT EXISTS RAW.south_dakota_voters_2023_11_06
(
    id                TEXT,
    last_name         TEXT,
    first_name        TEXT,
    middle_name       TEXT,
    suffix            TEXT,
    address           TEXT,
    city              TEXT,
    state             TEXT,
    zip               TEXT,
    status            TEXT,
    party             TEXT,
    other_party       TEXT,
    phone             TEXT,
    email             TEXT,
    precinct          TEXT,
    city1             TEXT,
    ward              TEXT,
    school            TEXT,
    school_board_area TEXT,
    senate            TEXT,
    house             TEXT,
    commissioner      TEXT,
    fire              TEXT,
    original_reg_date TEXT,
    last_reg_date     TEXT,
    last_updated_date TEXT,
    date_last_voted   TEXT,
    mailing_address   TEXT,
    mailing_city      TEXT,
    mailing_state     TEXT,
    mailing_zip       TEXT,
    county            TEXT,
    mailing_country   TEXT,
    house_number      TEXT,
    pre_street_dir    TEXT,
    street_name       TEXT,
    street_type       TEXT,
    post_street_dir   TEXT
);

COPY INTO RAW.south_dakota_voters_2023_11_06 FROM '@VOTER_FILES/south dakota/raw_data/file_date=2023_11_06/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';



CREATE TABLE IF NOT EXISTS RAW.south_dakota_ncoa_results_2023_11_06
(
    input_voter_id                      TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_address                       TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zip_code5                     TEXT,
    input_zip_code4                     TEXT,
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

COPY INTO RAW.south_dakota_ncoa_results_2023_11_06 FROM '@VOTER_FILES/south dakota/ncoa_data/file_date=2023_11_06/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}

