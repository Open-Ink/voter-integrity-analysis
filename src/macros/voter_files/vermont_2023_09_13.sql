{% macro import_vermont_voters() %}


CREATE TABLE IF NOT EXISTS RAW.vermont_voters_2023_09_27
(
    voter_id                        TEXT,
    last_name                       TEXT,
    first_name                      TEXT,
    middle_name                     TEXT,
    suffix                          TEXT,
    legal_address_line_1            TEXT,
    legal_address_line_2            TEXT,
    legal_address_city              TEXT,
    legal_address_state             TEXT,
    legal_address_zip               TEXT,
    mailing_address_line_1          TEXT,
    mailing_address_line_2          TEXT,
    mailing_address_city            TEXT,
    mailing_address_state           TEXT,
    mailing_address_zip             TEXT,
    year_of_birth                   TEXT,
    date_of_registration            TEXT,
    date_last_voted                 TEXT,
    gen_election_participation_2008 TEXT,
    gen_election_participation_2010 TEXT,
    gen_election_participation_2012 TEXT,
    gen_election_participation_2014 TEXT,
    gen_election_participation_2016 TEXT,
    gen_election_participation_2018 TEXT,
    gen_election_participation_2020 TEXT,
    gen_election_participation_2022 TEXT,
    status                          TEXT,
    town_of_registration            TEXT,
    county                          TEXT,
    senate_district                 TEXT,
    town_nemrc_number               TEXT,
    voting_district                 TEXT,
    polling_location                TEXT,
    police_district                 TEXT,
    sewer_district                  TEXT,
    garbage_district                TEXT,
    school_district                 TEXT,
    fire_district                   TEXT,
    water_district                  TEXT,
    village                         TEXT,
    ward                            TEXT
);

COPY INTO RAW.vermont_voters_2023_09_27 FROM '@VOTER_FILES/vermont/raw_data/file_date=2023_09_27/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';



CREATE TABLE IF NOT EXISTS RAW.vermont_ncoa_results_2023_09_27
(
    input_voter_id                      TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_address_line1                 TEXT,
    input_address_line2                 TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zip_code                      TEXT,
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

COPY INTO RAW.vermont_ncoa_results_2023_09_27 FROM '@VOTER_FILES/vermont/ncoa_data/file_date=2023_09_27/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}
