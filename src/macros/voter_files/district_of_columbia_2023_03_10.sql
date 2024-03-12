{% macro import_dc_voters() %}

CREATE TABLE IF NOT EXISTS RAW.district_of_columbia_raw_data_2023_03_10
(
    last_name                                         TEXT,
    first_name                                        TEXT,
    middle_name                                       TEXT,
    name_style                                        TEXT,
    street_number                                     TEXT,
    street_number_suffix                              TEXT,
    street_name                                       TEXT,
    street_type                                       TEXT,
    street_dir_suffix                                 TEXT,
    unit_type                                         TEXT,
    apartment_number                                  TEXT,
    city_name                                         TEXT,
    zip_code                                          TEXT,
    registration_date                                 TEXT,
    party                                             TEXT,
    precinct                                          TEXT,
    smd                                               TEXT,
    anc                                               TEXT,
    ward                                              TEXT,
    voter_status                                      TEXT,
    general_election_nov_08_2022                      TEXT,
    primary_election_jun_21_2022                      TEXT,
    dc_presidential_general_election_nov_03_2020      TEXT,
    special_election_ward_2_jun_16_2020               TEXT,
    dc_presidential_primary_election_jun_02_2020      TEXT,
    special_ward_4_board_of_ed_ele_dec_04_2018        TEXT,
    dc_general_election_nov_06_2018                   TEXT,
    dc_mayoral_primary_jun_19_2018                    TEXT,
    dc_presidential_general_election_nov_08_2016      TEXT,
    presidential_primary_election_jun_14_2016         TEXT,
    special_election_ward_4_and_8_apr_28_2015         TEXT,
    district_of_columbia_general_election_nov_04_2014 TEXT,
    special_bd_of_ed_election_ward_8_jul_15_2014      TEXT,
    dc_mayoral_primary_2014_apr_01_2014               TEXT,
    dist_of_columbia_at_large_special_e_apr_23_2013   TEXT,
    district_of_columbia_general_election_nov_06_2012 TEXT,
    special_election_ward_5_council_may_15_2012       TEXT,
    dc_presidential_pref_council_primary_apr_03_2012  TEXT,
    recall_special_election_4b04_feb_28_2012          TEXT,
    district_of_columbia_special_e_apr_26_2011        TEXT
);

CREATE TABLE IF NOT EXISTS RAW.district_of_columbia_ncoa_results_2023_03_10
(
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_name_style                    TEXT,
    input_addressline1                  TEXT,
    input_addressline2                  TEXT,
    input_city_name                     TEXT,
    input_zip_code                      TEXT,
    input_id                            TEXT,
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


COPY INTO RAW.district_of_columbia_raw_data_2023_03_10
    FROM '@VOTER_FILES/district of columbia/raw_data/file_date=2023_03_10/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';


COPY INTO RAW.district_of_columbia_ncoa_results_2023_03_10
    FROM '@VOTER_FILES/district of columbia/ncoa_data/file_date=2023_03_10/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}