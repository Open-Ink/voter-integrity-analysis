{% macro import_delaware_voters() %}


CREATE TABLE IF NOT EXISTS RAW.delaware_voters_2023_11_17
(
    county                                  TEXT,
    status                                  TEXT,
    title                                   TEXT,
    name_first                              TEXT,
    name_middle                             TEXT,
    name_last                               TEXT,
    name_suffix                             TEXT,
    voter_id                                TEXT,
    district_municipality                   TEXT,
    other_party_desc                        TEXT,
    res_addr_development_name               TEXT,
    res_addr_house_no_                      TEXT,
    res_addr_house_no_suffix                TEXT,
    res_addr_street_direction_prefix        TEXT,
    res_addr_street_name                    TEXT,
    res_addr_street_type                    TEXT,
    res_addr_street_direction_suffix        TEXT,
    res_addr_unit_type                      TEXT,
    res_addr_unit_number                    TEXT,
    res_addr_city                           TEXT,
    res_addr_state                          TEXT,
    res_addr_zip_code                       TEXT,
    res_addr_zip_4                          TEXT,
    res_addr_carrier_route                  TEXT,
    res_addr_military_ind                   TEXT,
    mail_addr_line1                         TEXT,
    mail_addr_line2                         TEXT,
    mail_addr_line3                         TEXT,
    mail_addr_line4                         TEXT,
    mail_addr_city                          TEXT,
    mail_addr_state                         TEXT,
    mail_addr_zip_code                      TEXT,
    mail_addr_zip_4                         TEXT,
    mail_addr_carrier_route                 TEXT,
    mail_addr_military_ind                  TEXT,
    mail_addr_foreign_ind                   TEXT,
    political_party                         TEXT,
    precinct_rded                           TEXT,
    year_of_birth                           TEXT,
    registration_date                       TEXT,
    party_affiliation_date                  TEXT,
    voting_history_1                        TEXT,
    voting_method_1                         TEXT,
    voting_history_2                        TEXT,
    voting_method_2                         TEXT,
    voting_history_3                        TEXT,
    voting_method_3                         TEXT,
    voting_history_4                        TEXT,
    voting_method_4                         TEXT,
    voting_history_5                        TEXT,
    voting_method_5                         TEXT,
    voting_history_6                        TEXT,
    voting_method_6                         TEXT,
    voting_history_7                        TEXT,
    voting_method_7                         TEXT,
    voting_history_8                        TEXT,
    voting_method_8                         TEXT,
    voting_history_9                        TEXT,
    voting_method_9                         TEXT,
    voting_history_10                       TEXT,
    voting_method_10                        TEXT,
    res_addr_non_standard                   TEXT,
    last_registration_update_date           TEXT,
    district_congressional                  TEXT,
    district_city_council_wilmington_only   TEXT,
    district_county_council_new_castle_only TEXT,
    district_county_council_sussex_only     TEXT,
    district_election                       TEXT,
    district_levy_court_kent_only           TEXT,
    district_representative                 TEXT,
    district_school                         TEXT,
    district_senate                         TEXT,
    perm_abs_status                         TEXT
);

COPY INTO RAW.delaware_voters_2023_11_17 FROM '@VOTER_FILES/delaware/raw_data/file_date=2023_11_17/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', ''),
        ENCODING = 'ISO-8859-1'
        )
    ON_ERROR = 'ABORT_STATEMENT';



CREATE TABLE IF NOT EXISTS RAW.delaware_ncoa_results_2023_11_17
(
    input_id                            TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
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

COPY INTO RAW.delaware_ncoa_results_2023_11_17 FROM '@VOTER_FILES/delaware/ncoa_data/file_date=2023_11_17/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}
