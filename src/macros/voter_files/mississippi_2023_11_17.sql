{% macro import_mississippi_voters() %}

CREATE TABLE IF NOT EXISTS RAW.mississippi_raw_data_2023_12_11
(
    mapping_value       TEXT,
    first_name          TEXT,
    middle_name         TEXT,
    last_name           TEXT,
    suffix              TEXT,
    residential_address TEXT,
    house_num           TEXT,
    street_name         TEXT,
    street_type         TEXT,
    pre_direction       TEXT,
    post_direction      TEXT,
    res_city            TEXT,
    res_state           TEXT,
    res_zip_code        TEXT,
    res_county          TEXT,
    precinct_code       TEXT,
    precinct_name       TEXT,
    mailing_address     TEXT,
    mail_city           TEXT,
    mail_state          TEXT,
    mail_zip_code       TEXT,
    effective_regn_date TEXT,
    status              TEXT,
    date_voted          TEXT,
    us                  TEXT,
    ms                  TEXT,
    cong                TEXT,
    sc                  TEXT,
    psc                 TEXT,
    tc                  TEXT,
    da                  TEXT,
    sen                 TEXT,
    rep                 TEXT,
    ca                  TEXT,
    chc                 TEXT,
    cir                 TEXT,
    cnt                 TEXT,
    lev                 TEXT,
    coct                TEXT,
    jud                 TEXT,
    schc                TEXT,
    scir                TEXT,
    sup                 TEXT,
    supr                TEXT,
    ec                  TEXT,
    jc                  TEXT,
    jcj                 TEXT,
    con                 TEXT,
    mun                 TEXT,
    ward                TEXT,
    wardp               TEXT,
    mp                  TEXT,
    schd                TEXT,
    schb                TEXT,
    sbal                TEXT,
    fire                TEXT,
    fcd                 TEXT,
    wsd                 TEXT,
    ipd                 TEXT
);

CREATE TABLE IF NOT EXISTS RAW.mississippi_ncoa_results_2023_12_11
(
    input_id                            TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
    input_suffix                        TEXT,
    input_residential_address           TEXT,
    input_res_city                      TEXT,
    input_res_state                     TEXT,
    input_res_zip_code                  TEXT,
    input_res_county                    TEXT,
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

CREATE TABLE IF NOT EXISTS RAW.mississippi_voter_history_2023_12_11
(
    mapping_value   TEXT,
    first_name      TEXT,
    middle_name     TEXT,
    last_name       TEXT,
    suffix          TEXT,
    election_name   TEXT,
    election_type   TEXT,
    election_date   TEXT,
    political_party TEXT,
    DUP             TEXT
);


COPY INTO RAW.mississippi_raw_data_2023_12_11
    FROM @VOTER_FILES/mississippi/raw_data/file_date=2023_12_11/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'CONTINUE';

COPY INTO RAW.mississippi_ncoa_results_2023_12_11
    FROM @VOTER_FILES/mississippi/ncoa_data/file_date=2023_12_11/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.mississippi_voter_history_2023_12_11
    FROM @VOTER_FILES/mississippi/voting_history/file_date=2023_12_11/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'CONTINUE'

{% endmacro %}