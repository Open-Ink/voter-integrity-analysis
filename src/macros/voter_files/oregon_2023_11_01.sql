{% macro import_oregon_voters() %}

CREATE TABLE IF NOT EXISTS RAW.oregon_voters_2023_11_01
(
    voter_id          TEXT,
    first_name        TEXT,
    middle_name       TEXT,
    last_name         TEXT,
    name_suffix       TEXT,
    birth_date        TEXT,
    confidential      TEXT,
    eff_regn_date     TEXT,
    status            TEXT,
    party_code        TEXT,
    phone_num         TEXT,
    unlisted          TEXT,
    county            TEXT,
    res_address_1     TEXT,
    res_address_2     TEXT,
    house_num         TEXT,
    house_suffix      TEXT,
    pre_direction     TEXT,
    street_name       TEXT,
    street_type       TEXT,
    post_direction    TEXT,
    unit_type         TEXT,
    unit_num          TEXT,
    addr_non_std      TEXT,
    city              TEXT,
    state             TEXT,
    zip_code          TEXT,
    zip_plus_four     TEXT,
    eff_address_1     TEXT,
    eff_address_2     TEXT,
    eff_address_3     TEXT,
    eff_address_4     TEXT,
    eff_city          TEXT,
    eff_state         TEXT,
    eff_zip_code      TEXT,
    eff_zip_plus_four TEXT,
    absentee_type     TEXT,
    precinct_name     TEXT,
    precinct          TEXT,
    split             TEXT
);

CREATE TABLE IF NOT EXISTS RAW.oregon_ncoa_results_2023_11_01
(
    input_voter_id                      TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
    input_name_suffix                   TEXT,
    input_county                        TEXT,
    input_addressline1                  TEXT,
    input_addressline2                  TEXT,
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

COPY INTO RAW.oregon_voters_2023_11_01
    FROM @VOTER_FILES/oregon/raw_data/file_date=2023_11_01/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.oregon_ncoa_results_2023_11_01
    FROM @VOTER_FILES/oregon/ncoa_data/file_date=2023_11_01/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}