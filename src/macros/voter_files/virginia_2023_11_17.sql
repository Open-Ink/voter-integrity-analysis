{% macro import_virginia_voters() %}


CREATE TABLE IF NOT EXISTS RAW.virginia_voters_2023_11_17
(
    inv_no                        TEXT,
    identification_number         TEXT,
    last_name                     TEXT,
    first_name                    TEXT,
    middle_name                   TEXT,
    suffix                        TEXT,
    house_number                  TEXT,
    housenumbersuffix             TEXT,
    street_name                   TEXT,
    streettypecodename            TEXT,
    direction                     TEXT,
    post_direction                TEXT,
    apt_num                       TEXT,
    city                          TEXT,
    state                         TEXT,
    zip                           TEXT,
    address_line_1                TEXT,
    address_line_2                TEXT,
    address_line_3                TEXT,
    locality_code                 TEXT,
    localityname                  TEXT,
    precinct_code_value           TEXT,
    precinctname                  TEXT,
    townname_code_value           TEXT,
    townname_code_name            TEXT,
    townprec_code_value           TEXT,
    townprec_code_name            TEXT,
    cong_code_value               TEXT,
    stsenate_code_value           TEXT,
    sthouse_code_value            TEXT,
    gender                        TEXT,
    dob                           TEXT,
    registration_date             TEXT,
    effective_date                TEXT,
    mailing_address_line_1        TEXT,
    mailing_address_line_2        TEXT,
    mailing_address_line_3        TEXT,
    mailing_city                  TEXT,
    mailing_state                 TEXT,
    mailing_zip                   TEXT,
    superdist_code_value          TEXT,
    superdist_code_name           TEXT,
    mailing_address_use_residence TEXT,
    status                        TEXT
);

COPY INTO RAW.virginia_voters_2023_11_17 FROM '@VOTER_FILES/virginia/raw_data/file_date=2023_11_17/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', ''), ENCODING = 'ISO-8859-1'
        )
    ON_ERROR = 'ABORT_STATEMENT';



CREATE TABLE IF NOT EXISTS RAW.virginia_ncoa_results_2023_11_17
(
    input_identification_number         TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zip                           TEXT,
    input_address_line_1                TEXT,
    input_address_line_2                TEXT,
    input_locality_name                 TEXT,
    input_town_name                     TEXT,
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

COPY INTO RAW.virginia_ncoa_results_2023_11_17 FROM '@VOTER_FILES/virginia/ncoa_data/file_date=2023_11_17/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}
