{% macro import_alaska_voters() %}


CREATE TABLE IF NOT EXISTS RAW.alaska_voters_2023_11_13
(
    un                TEXT,
    party             TEXT,
    dp                TEXT,
    last_name         TEXT,
    first_name        TEXT,
    middle_name       TEXT,
    suffix_name       TEXT,
    ascension         TEXT,
    reg_date          TEXT,
    org_reg_date      TEXT,
    dist_date         TEXT,
    residence_address TEXT,
    residence_city    TEXT,
    residence_zip     TEXT,
    mailing_address1  TEXT,
    mailing_address2  TEXT,
    mailing_address3  TEXT,
    mailing_city      TEXT,
    mailing_state     TEXT,
    mailing_zip       TEXT,
    mailing_country   TEXT,
    gender            TEXT,
    vh1               TEXT,
    vh2               TEXT,
    vh3               TEXT,
    vh4               TEXT,
    vh5               TEXT,
    vh6               TEXT,
    vh7               TEXT,
    vh8               TEXT,
    vh9               TEXT,
    vh10              TEXT,
    vh11              TEXT,
    vh12              TEXT,
    vh13              TEXT,
    vh14              TEXT,
    vh15              TEXT,
    vh16              TEXT,
    DUP               TEXT
);


CREATE TABLE IF NOT EXISTS RAW.alaska_ncoa_results_2023_11_13
(
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix_name                   TEXT,
    input_ascension                     TEXT,
    input_residence_address             TEXT,
    input_residence_city                TEXT,
    input_residence_zip                 TEXT,
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


COPY INTO RAW.alaska_voters_2023_11_13 FROM '@VOTER_FILES/alaska/raw_data/file_date=2023_11_13/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', ''),
        REPLACE_INVALID_CHARACTERS = TRUE
        );


COPY INTO RAW.alaska_ncoa_results_2023_11_13 FROM '@VOTER_FILES/alaska/ncoa_data/file_date=2023_11_13/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )


{% endmacro %}
