{% macro import_maryland_voters() %}

CREATE TABLE IF NOT EXISTS RAW.maryland_voters_2023_12_05
(
    vtr_id                   TEXT,
    last_name                TEXT,
    first_name               TEXT,
    middle_name              TEXT,
    suffix                   TEXT,
    gender                   TEXT,
    party                    TEXT,
    house_number             TEXT,
    house_suffix             TEXT,
    street_pre_direction     TEXT,
    street_name              TEXT,
    street_type              TEXT,
    street_post_direction    TEXT,
    unit_type                TEXT,
    unit_number              TEXT,
    address                  TEXT,
    non_std_address          TEXT,
    residential_city         TEXT,
    residential_state        TEXT,
    residential_zip5         TEXT,
    residential_zip4         TEXT,
    mailing_address          TEXT,
    mailing_city             TEXT,
    mailing_state            TEXT,
    mailing_zip5             TEXT,
    mailing_zip4             TEXT,
    country                  TEXT,
    status_code              TEXT,
    state_registration_date  TEXT,
    county_registration_date TEXT,
    precinct                 TEXT,
    split                    TEXT,
    county                   TEXT,
    congressional_districts  TEXT,
    legislative_districts    TEXT,
    councilmanic_districts   TEXT,
    ward_districts           TEXT,
    municipal_districts      TEXT,
    commissioner_districts   TEXT,
    school_districts         TEXT
);

CREATE TABLE IF NOT EXISTS RAW.maryland_ncoa_results_2023_12_05
(
    input_id                            TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_lastname                      TEXT,
    input_suffix                        TEXT,
    input_address_1                     TEXT,
    input_address_2                     TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zip                           TEXT,
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

CREATE TABLE IF NOT EXISTS RAW.maryland_voter_history_2023_12_05
(
    voter_id              TEXT,
    election_date         TEXT,
    election_description  TEXT,
    election_type         TEXT,
    political_party       TEXT,
    election_code         TEXT,
    voting_method         TEXT,
    date_of_voting        TEXT,
    precinct              TEXT,
    early_voting_location TEXT,
    jurisdiction_code     TEXT,
    county_name           TEXT
);


COPY INTO RAW.maryland_voters_2023_12_05
    FROM @VOTER_FILES/maryland/raw_data/file_date=2023_12_05/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.maryland_ncoa_results_2023_12_05
    FROM @VOTER_FILES/maryland/ncoa_data/file_date=2023_12_05/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.maryland_voter_history_2023_12_05
    FROM @VOTER_FILES/maryland/voter_history/file_date=2023_12_05/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'CONTINUE'

{% endmacro %}