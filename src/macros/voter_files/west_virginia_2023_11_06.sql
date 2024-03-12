{% macro import_west_virginia_voters() %}


CREATE TABLE IF NOT EXISTS RAW.west_virginia_voters_2023_11_06
(
    id_voter               TEXT,
    county_name            TEXT,
    first_name             TEXT,
    mid                    TEXT,
    last_name              TEXT,
    suffix                 TEXT,
    date_of_birth          TEXT,
    sex                    TEXT,
    house_no               TEXT,
    street                 TEXT,
    street2                TEXT,
    unit                   TEXT,
    city                   TEXT,
    state                  TEXT,
    zip                    TEXT,
    mail_house_no          TEXT,
    mail_street            TEXT,
    mail_street2           TEXT,
    mail_unit              TEXT,
    mail_city              TEXT,
    mail_state             TEXT,
    mail_zip               TEXT,
    registration_date      TEXT,
    partyaffiliation       TEXT,
    status                 TEXT,
    congressional_district TEXT,
    magisterial_district   TEXT,
    precinct_number        TEXT,
    poll_name              TEXT
);

COPY INTO RAW.west_virginia_voters_2023_11_06 FROM '@VOTER_FILES/west virginia/raw_data/file_date=2023_11_06/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '|',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';



CREATE TABLE IF NOT EXISTS RAW.west_virginia_ncoa_results_2023_11_06
(
    input_voter_id                      TEXT,
    input_county                        TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
    input_suffix                        TEXT,
    input_address_line1                 TEXT,
    input_address_line2                 TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zipcode                       TEXT,
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

COPY INTO RAW.west_virginia_ncoa_results_2023_11_06 FROM '@VOTER_FILES/west virginia/ncoa_data/file_date=2023_11_06/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

CREATE TABLE IF NOT EXISTS RAW.WEST_VIRGINIA_VOTER_HISTORY
(
    ID_VOTER         TEXT,
    ID_ELECTION      TEXT,
    DT_ELECTION      TEXT,
    NM_ELECTION      TEXT,
    CD_ELECTION_TYPE TEXT,
    CD_ELECTION_CAT  TEXT,
    CD_ENTRY_TYPE    TEXT
);

COPY INTO RAW.WEST_VIRGINIA_VOTER_HISTORY FROM '@VOTER_FILES/west virginia/voter_history/file_date=2023_11_06/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '|',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}
