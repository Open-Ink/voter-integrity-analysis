{% macro import_arizona_voters() %}

CREATE TABLE IF NOT EXISTS RAW.arizona_voters_2023_11_05
(
    voter_id          TEXT,
    vraz_voter_id     TEXT,
    registration_date TEXT,
    year_of_birth     TEXT,
    last_name         TEXT,
    first_name        TEXT,
    middle_name       TEXT,
    suffix            TEXT,
    status            TEXT,
    registrant_county TEXT,
    gen_voter_id      TEXT,
    house_number      TEXT,
    street_prefix     TEXT,
    street_name       TEXT,
    street_type       TEXT,
    street_suffix     TEXT,
    unit_type         TEXT,
    unit_number       TEXT,
    address_line2     TEXT,
    residence_address TEXT,
    address_line1     TEXT,
    residence_city    TEXT,
    residence_state   TEXT,
    residence_zip     TEXT,
    mailing_address   TEXT,
    mailing_address2  TEXT,
    mailing_city      TEXT,
    mailing_state     TEXT,
    mailing_zip       TEXT,
    mailing_country   TEXT,
    party             TEXT,
    congressional     TEXT,
    legislative       TEXT,
    municipal         TEXT,
    school            TEXT,
    fire              TEXT,
    precinct          TEXT,
    ssn               TEXT,
    fraction          TEXT,
    direction         TEXT
);

COPY INTO RAW.arizona_voters_2023_11_05 FROM '@VOTER_FILES/arizona/normalized_data/file_date=2023_11_05/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';



CREATE TABLE IF NOT EXISTS RAW.arizona_ncoa_results_2023_11_05
(
    input_voter_id                      TEXT,
    input_vraz_voter_id                 TEXT,
    input_registration_date             TEXT,
    input_year_of_birth                 TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_status                        TEXT,
    input_registrant_county             TEXT,
    input_gen_voter_id                  TEXT,
    input_house_number                  TEXT,
    input_street_prefix                 TEXT,
    input_street_name                   TEXT,
    input_street_type                   TEXT,
    input_street_suffix                 TEXT,
    input_unit_type                     TEXT,
    input_unit_number                   TEXT,
    input_address_line2                 TEXT,
    input_residence_address             TEXT,
    input_address_line1                 TEXT,
    input_residence_city                TEXT,
    input_residence_state               TEXT,
    input_residence_zip                 TEXT,
    input_mailing_address               TEXT,
    input_mailing_address2              TEXT,
    input_mailing_city                  TEXT,
    input_mailing_state                 TEXT,
    input_mailing_zip                   TEXT,
    input_mailing_country               TEXT,
    input_party                         TEXT,
    input_congressional                 TEXT,
    input_legislative                   TEXT,
    input_municipal                     TEXT,
    input_school                        TEXT,
    input_fire                          TEXT,
    input_precinct                      TEXT,
    input_ssn                           TEXT,
    input_fraction                      TEXT,
    input_direction                     TEXT,
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

COPY INTO RAW.arizona_ncoa_results_2023_11_05 FROM '@VOTER_FILES/arizona/ncoa_data/file_date=2023_11_05/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}
