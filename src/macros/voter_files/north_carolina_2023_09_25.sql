{% macro import_north_carolina_voters() %}

CREATE TABLE IF NOT EXISTS RAW.north_carolina_voters_2023_07_21
(
    county_id                TEXT,
    county_desc              TEXT,
    voter_reg_num            TEXT,
    ncid                     TEXT,
    last_name                TEXT,
    first_name               TEXT,
    middle_name              TEXT,
    name_suffix_lbl          TEXT,
    status_cd                TEXT,
    voter_status_desc        TEXT,
    reason_cd                TEXT,
    voter_status_reason_desc TEXT,
    res_street_address       TEXT,
    res_city_desc            TEXT,
    state_cd                 TEXT,
    zip_code                 TEXT,
    mail_addr1               TEXT,
    mail_addr2               TEXT,
    mail_addr3               TEXT,
    mail_addr4               TEXT,
    mail_city                TEXT,
    mail_state               TEXT,
    mail_zipcode             TEXT,
    full_phone_number        TEXT,
    confidential_ind         TEXT,
    registr_dt               TEXT,
    race_code                TEXT,
    ethnic_code              TEXT,
    party_cd                 TEXT,
    gender_code              TEXT,
    birth_year               TEXT,
    age_at_year_end          TEXT,
    birth_state              TEXT,
    drivers_lic              TEXT,
    precinct_abbrv           TEXT,
    precinct_desc            TEXT,
    municipality_abbrv       TEXT,
    municipality_desc        TEXT,
    ward_abbrv               TEXT,
    ward_desc                TEXT,
    cong_dist_abbrv          TEXT,
    super_court_abbrv        TEXT,
    judic_dist_abbrv         TEXT,
    nc_senate_abbrv          TEXT,
    nc_house_abbrv           TEXT,
    county_commiss_abbrv     TEXT,
    county_commiss_desc      TEXT,
    township_abbrv           TEXT,
    township_desc            TEXT,
    school_dist_abbrv        TEXT,
    school_dist_desc         TEXT,
    fire_dist_abbrv          TEXT,
    fire_dist_desc           TEXT,
    water_dist_abbrv         TEXT,
    water_dist_desc          TEXT,
    sewer_dist_abbrv         TEXT,
    sewer_dist_desc          TEXT,
    sanit_dist_abbrv         TEXT,
    sanit_dist_desc          TEXT,
    rescue_dist_abbrv        TEXT,
    rescue_dist_desc         TEXT,
    munic_dist_abbrv         TEXT,
    munic_dist_desc          TEXT,
    dist_1_abbrv             TEXT,
    dist_1_desc              TEXT,
    vtd_abbrv                TEXT,
    vtd_desc                 TEXT
);

CREATE TABLE IF NOT EXISTS RAW.north_carolina_ncoa_results_2023_07_21
(
    input_file_date                     TEXT,
    input_county_id                     TEXT,
    input_voter_reg_num                 TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_name_suffix_lbl               TEXT,
    input_res_street_address            TEXT,
    input_res_city_desc                 TEXT,
    input_state_cd                      TEXT,
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

COPY INTO RAW.north_carolina_voters_2023_07_21
    FROM @VOTER_FILES/north_carolina/raw_data/file_date=2023_07_21/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '\t',
        REPLACE_INVALID_CHARACTERS=TRUE
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '', ' ')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.north_carolina_ncoa_results_2023_07_21
    FROM @VOTER_FILES/north_carolina/ncoa_data/file_date=2023_07_21/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        REPLACE_INVALID_CHARACTERS=TRUE
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '', ' ')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}