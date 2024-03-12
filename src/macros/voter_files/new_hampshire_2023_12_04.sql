{% macro import_new_hampshire_voters() %}

CREATE TABLE IF NOT EXISTS RAW.new_hampshire_voters_2023_12_04
(
    id_voter          TEXT,
    nm_last           TEXT,
    nm_first          TEXT,
    nm_mid            TEXT,
    nm_suff           TEXT,
    cd_party          TEXT,
    ad_num            TEXT,
    ad_num_suffix_a   TEXT,
    ad_num_suffix_b   TEXT,
    ad_str1           TEXT,
    ad_unit           TEXT,
    ad_str2           TEXT,
    ad_str3           TEXT,
    ad_city           TEXT,
    ad_mail_city      TEXT,
    ad_st             TEXT,
    ad_zip5           TEXT,
    ad_zip4           TEXT,
    mail_num          TEXT,
    mail_num_suffix_a TEXT,
    mail_num_suffix_b TEXT,
    mail_str1         TEXT,
    mail_unit         TEXT,
    mail_str2         TEXT,
    mail_str3         TEXT,
    mail_city         TEXT,
    mail_st           TEXT,
    mail_zip5         TEXT,
    mail_zip4         TEXT,
    ward              TEXT,
    county            TEXT
);

CREATE TABLE IF NOT EXISTS RAW.new_hampshire_ncoa_results_2023_12_04
(
    input_id                            TEXT,
    input_firstname                     TEXT,
    input_middle_name                   TEXT,
    input_lastname                      TEXT,
    input_suffix                        TEXT,
    input_address_line_1                TEXT,
    input_address_line_2                TEXT,
    input_city                          TEXT,
    input_state                         TEXT,
    input_zipcode                       TEXT,
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

CREATE TABLE IF NOT EXISTS RAW.new_hampshire_voter_history_2023_12_04
(
    town              TEXT,
    cd_part_voted     TEXT,
    ballot_type       TEXT,
    election_category TEXT,
    election_type     TEXT,
    election_name     TEXT,
    election_date     TEXT,
    id_voter          TEXT
);

COPY INTO RAW.new_hampshire_ncoa_results_2023_12_04
    FROM '@VOTER_FILES/new hampshire/ncoa_results/file_date=2023_12_04/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.new_hampshire_voters_2023_12_04
    FROM '@VOTER_FILES/new hampshire/raw_data/file_date=2023_12_04/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';


COPY INTO RAW.new_hampshire_voter_history_2023_12_04
    FROM '@VOTER_FILES/new hampshire/voter_history/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}