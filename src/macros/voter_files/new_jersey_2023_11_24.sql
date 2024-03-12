{% macro import_new_jersey_voters() %}
CREATE TABLE IF NOT EXISTS RAW.new_jersey_voters_2023_11_24
(
    display_id    TEXT,
    leg_id        TEXT,
    party         TEXT,
    status        TEXT,
    reg_date      TEXT,
    last_name     TEXT,
    first_name    TEXT,
    middle_name   TEXT,
    name_suffix   TEXT,
    dob           TEXT,
    street_num    TEXT,
    street_pre    TEXT,
    street_post   TEXT,
    street_base   TEXT,
    street_suffix TEXT,
    street_name   TEXT,
    apt_unit      TEXT,
    city          TEXT,
    zip           TEXT,
    county        TEXT,
    municipality  TEXT,
    ward          TEXT,
    district      TEXT,
    congressional TEXT,
    legislative   TEXT,
    freeholder    TEXT,
    school        TEXT,
    fire          TEXT
);

CREATE TABLE IF NOT EXISTS RAW.new_jersey_ncoa_results_2023_11_24
(
    input_displayid                     TEXT,
    input_leg_id                        TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_last_name                     TEXT,
    input_suffix                        TEXT,
    input_addressline1                  TEXT,
    input_addressline2                  TEXT,
    input_city                          TEXT,
    input_county                        TEXT,
    input_zip_code                      TEXT,
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



CREATE TABLE IF NOT EXISTS RAW.new_jersey_voter_history_2023_11_24
(
    voter_id               TEXT,
    voter_legacyid         TEXT,
    voter_party            TEXT,
    voter_status           TEXT,
    voter_registrationdate TEXT,
    voter_first            TEXT,
    voter_middle           TEXT,
    voter_last             TEXT,
    voter_sex              TEXT,
    voter_dob              TEXT,
    voter_phone            TEXT,
    res_street_num         TEXT,
    res_street_pre         TEXT,
    res_street_post        TEXT,
    res_street_base        TEXT,
    res_street_suff        TEXT,
    res_street_name        TEXT,
    res_address2           TEXT,
    res_city               TEXT,
    res_state              TEXT,
    res_zipcode            TEXT,
    res_zipcode4           TEXT,
    mail_address1          TEXT,
    mail_address2          TEXT,
    mail_city              TEXT,
    mail_state             TEXT,
    mail_zipcode           TEXT,
    residence_countyname   TEXT,
    residence_munname      TEXT,
    residence_muncode      TEXT,
    residence_wardcode     TEXT,
    residence_distcode     TEXT,
    residence_congcode     TEXT,
    residence_legcode      TEXT,
    residence_firecode     TEXT,
    residence_freecode     TEXT,
    residence_schoolcode   TEXT,
    election_name          TEXT,
    election_date          TEXT,
    election_type          TEXT,
    ballot_type            TEXT
);

COPY INTO RAW.new_jersey_voters_2023_11_24
    FROM '@VOTER_FILES/new jersey/raw_data/file_date=2023_11_24/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.new_jersey_ncoa_results_2023_11_24
    FROM '@VOTER_FILES/new jersey/ncoa_data/file_date=2023_11_24/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.new_jersey_voter_history_2023_11_24
    FROM '@VOTER_FILES/new jersey/voter_history/file_date=2023_11_24/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'


{% endmacro %}