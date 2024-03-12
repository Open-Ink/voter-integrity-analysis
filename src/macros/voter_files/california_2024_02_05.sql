{% macro import_california_voters() %}

CREATE TABLE IF NOT EXISTS RAW.california_voters_2024_02_05
(
    county_code                   TEXT,
    registrant_id                 TEXT,
    extract_date                  TEXT,
    last_name                     TEXT,
    first_name                    TEXT,
    middle_name                   TEXT,
    suffix                        TEXT,
    address_number                TEXT,
    house_fraction_number         TEXT,
    address_number_suffix         TEXT,
    street_dir_prefix             TEXT,
    street_name                   TEXT,
    street_type                   TEXT,
    street_dir_suffix             TEXT,
    unit_type                     TEXT,
    unit_number                   TEXT,
    city                          TEXT,
    state                         TEXT,
    zip                           TEXT,
    phone1_area                   TEXT,
    phone1_exchange               TEXT,
    phone1_number_part            TEXT,
    phone2_area                   TEXT,
    phone2_exchange               TEXT,
    phone2_number_part            TEXT,
    phone3_area                   TEXT,
    phone3_exchange               TEXT,
    phone3_number_part            TEXT,
    phone4_area                   TEXT,
    phone4_exchange               TEXT,
    phone4_number_part            TEXT,
    email                         TEXT,
    mailing_address_line1         TEXT,
    mailing_address_line2         TEXT,
    mailing_address_line3         TEXT,
    mailing_city                  TEXT,
    mailing_state                 TEXT,
    mailing_zip5                  TEXT,
    mailing_country               TEXT,
    language                      TEXT,
    dob                           TEXT,
    gender                        TEXT,
    party_code                    TEXT,
    status                        TEXT,
    registration_date             TEXT,
    precinct                      TEXT,
    precinct_number               TEXT,
    registration_method_code      TEXT,
    place_of_birth                TEXT,
    name_prefix                   TEXT,
    non_standard_address          TEXT,
    voter_status_reason_code_desc TEXT,
    assistance_request_flag       TEXT,
    vbm_voter_type                TEXT,
    ems_voter_id                  TEXT,
    precinct_id                   TEXT
);

COPY INTO RAW.california_voters_2024_02_05 FROM '@VOTER_FILES/california/raw_data/file_date=2024_02_05/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', ''), ENCODING = 'ISO-8859-1'
        )
    ON_ERROR = 'ABORT_STATEMENT';

CREATE TABLE IF NOT EXISTS RAW.california_ncoa_results_2024_02_05
(
    input_county_code                   TEXT,
    input_registrant_id                 TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_address_line_1                TEXT,
    input_address_line_2                TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zip                           TEXT,
    input_name_prefix                   TEXT,
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

COPY INTO RAW.california_ncoa_results_2024_02_05 FROM '@VOTER_FILES/california/ncoa_data/file_date=2024_02_05/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

CREATE TABLE IF NOT EXISTS RAW.california_voter_history_2024_02_05
(
    County_Code        TEXT,
    Registrant_ID      TEXT,
    Extract_Date       TEXT,
    Election_Type      TEXT,
    Election_Type_Desc TEXT,
    Election_Date      TEXT,
    Election_Name      TEXT,
    Method             TEXT
);

COPY INTO RAW.california_voter_history_2024_02_05 FROM '@VOTER_FILES/california/voter_history/file_date=2024_02_05/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}
