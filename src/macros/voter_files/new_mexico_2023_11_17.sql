{% macro import_new_mexico_voters() %}

CREATE TABLE IF NOT EXISTS RAW.new_mexico_raw_data_2023_11_17
(
    id                                  TEXT,
    dl_or_id_no_restricted              TEXT,
    registration_date                   TEXT,
    dob_restricted                      TEXT,
    last_name                           TEXT,
    first_name                          TEXT,
    middle_name                         TEXT,
    name_suffix                         TEXT,
    gender                              TEXT,
    status                              TEXT,
    county                              TEXT,
    residence_house_no                  TEXT,
    residence_street_prefix             TEXT,
    residence_street_name               TEXT,
    residence_street_type               TEXT,
    residence_street_suffix             TEXT,
    residence_unit_type                 TEXT,
    residence_unit_no                   TEXT,
    residence_address                   TEXT,
    residence_city                      TEXT,
    residence_state                     TEXT,
    residence_zip                       TEXT,
    mailing_address                     TEXT,
    mailing_address_line_2              TEXT,
    mailing_city                        TEXT,
    mailing_state                       TEXT,
    mailing_zip                         TEXT,
    mailing_country                     TEXT,
    party                               TEXT,
    precinct_part                       TEXT,
    congressional                       TEXT,
    conservancy                         TEXT,
    councilor                           TEXT,
    county_commissioner                 TEXT,
    district_attorney_judicial_district TEXT,
    education_commission                TEXT,
    flood_control                       TEXT,
    hospital                            TEXT,
    judge_of_the_metropolitan_court     TEXT,
    judicial_district                   TEXT,
    legislative                         TEXT,
    magistrate                          TEXT,
    municipal                           TEXT,
    public_regulation                   TEXT,
    school                              TEXT,
    senate                              TEXT,
    soil_and_water                      TEXT,
    ward                                TEXT,
    phone_restricted                    TEXT,
    age                                 TEXT,
    ballot_marking_approved             TEXT,
    college_board                       TEXT,
    vra_id_no                           TEXT,
    school_board                        TEXT
);
CREATE TABLE IF NOT EXISTS RAW.new_mexico_ncoa_results_2023_11_17
(
    input_id                            TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_name_suffix                   TEXT,
    input_county                        TEXT,
    input_addressline1                  TEXT,
    input_addressline2                  TEXT,
    input_residence_city                TEXT,
    input_residence_state               TEXT,
    input_zip_code_0                    TEXT,
    input_vra_id                        TEXT,
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


COPY INTO RAW.new_mexico_raw_data_2023_11_17
    FROM '@VOTER_FILES/new mexico/raw_data/file_date=2023_11_17/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 2, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'CONTINUE';

COPY INTO RAW.new_mexico_ncoa_results_2023_11_17
    FROM '@VOTER_FILES/new mexico/ncoa_data/file_date=2023_11_17/New_Mexico_Filtered.csv'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}