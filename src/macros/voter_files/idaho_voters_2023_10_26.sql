{% macro import_idaho_voters() %}

CREATE TABLE IF NOT EXISTS RAW.idaho_voters_2023_10_26
(
    voter_id                TEXT,
    age                     TEXT,
    prefix                  TEXT,
    first_name              TEXT,
    last_name               TEXT,
    suffix                  TEXT,
    middle_name             TEXT,
    gender                  TEXT,
    res_house_number        TEXT,
    res_house_partial       TEXT,
    res_pre_dir             TEXT,
    res_street              TEXT,
    res_street_type         TEXT,
    res_post_dir            TEXT,
    res_sub_location_type   TEXT,
    res_sub_location        TEXT,
    res_city_desc           TEXT,
    res_state               TEXT,
    res_zip5                TEXT,
    res_county_desc         TEXT,
    mail_res_addr_1         TEXT,
    mail_res_addr_2         TEXT,
    mail_res_city           TEXT,
    mail_res_zip            TEXT,
    mail_res_state          TEXT,
    mail_res_country        TEXT,
    registration_date       TEXT,
    party_desc              TEXT,
    precinct                TEXT,
    split                   TEXT,
    precinct_label          TEXT,
    vote_date_2022_05_17    TEXT,
    vote_type_2022_05_17    TEXT,
    ballot_style_2022_05_17 TEXT,
    vote_date_2022_11_08    TEXT,
    vote_type_2022_11_08    TEXT,
    ballot_style_2022_11_08 TEXT,
    vote_date_2023_05_16    TEXT,
    vote_type_2023_05_16    TEXT,
    ballot_style_2023_05_16 TEXT,
    vote_date_2023_11_07    TEXT,
    vote_type_2023_11_07    TEXT,
    ballot_style_2023_11_07 TEXT,
    vote_date_2018_11_06    TEXT,
    vote_type_2018_11_06    TEXT,
    ballot_style_2018_11_06 TEXT,
    vote_date_2020_03_10    TEXT,
    vote_type_2020_03_10    TEXT,
    ballot_style_2020_03_10 TEXT,
    vote_date_2020_05_19    TEXT,
    vote_type_2020_05_19    TEXT,
    ballot_style_2020_05_19 TEXT,
    vote_date_2020_11_03    TEXT,
    vote_type_2020_11_03    TEXT,
    ballot_style_2020_11_03 TEXT,
    legislative_district    TEXT,
    congressional_district  TEXT,
    hava_id_req             TEXT,
    res_req                 TEXT
);

CREATE TABLE IF NOT EXISTS RAW.idaho_ncoa_results_2023_10_26
(
    input_voter_id                      TEXT,
    input_firstname                     TEXT,
    input_lastname                      TEXT,
    input_suffix                        TEXT,
    input_middle_name                   TEXT,
    input_address_line_1                TEXT,
    input_address_line_2                TEXT,
    input_res_city_desc                 TEXT,
    input_res_state                     TEXT,
    input_res_zip_5                     TEXT,
    input_res_county_desc               TEXT,
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

COPY INTO RAW.idaho_voters_2023_10_26
    FROM '@VOTER_FILES/idaho/raw_data/file_date=2023_10_26/10.26.23 Statewide Voter List w History.csv'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.idaho_ncoa_results_2023_10_26
    FROM @VOTER_FILES/idaho/ncoa_data/file_date=2023_10_26/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}