{% macro import_georgia_voters() %}

CREATE TABLE IF NOT EXISTS RAW.georgia_voters_2023_09_13
(
    county                          TEXT,
    voter_registration_number       TEXT,
    status                          TEXT,
    status_reason                   TEXT,
    last_name                       TEXT,
    first_name                      TEXT,
    middle_name                     TEXT,
    suffix                          TEXT,
    birth_year                      TEXT,
    residence_street_number         TEXT,
    residence_pre_direction         TEXT,
    residence_street_name           TEXT,
    residence_street_type           TEXT,
    residence_post_direction        TEXT,
    residence_apt_unit_number       TEXT,
    residence_city                  TEXT,
    residence_zipcode               TEXT,
    county_precinct                 TEXT,
    county_precinct_description     TEXT,
    municipal_precinct              TEXT,
    municipal_precinct_description  TEXT,
    congressional_district          TEXT,
    state_senate_district           TEXT,
    state_house_district            TEXT,
    judicial_district               TEXT,
    county_commission_district      TEXT,
    school_board_district           TEXT,
    city_council_district           TEXT,
    municipal_school_board_district TEXT,
    water_board_district            TEXT,
    super_council_district          TEXT,
    super_commissioner_district     TEXT,
    super_school_board_district     TEXT,
    fire_district                   TEXT,
    municipality                    TEXT,
    combo                           TEXT,
    land_lot                        TEXT,
    land_district                   TEXT,
    registration_date               TEXT,
    race                            TEXT,
    gender                          TEXT,
    last_modified_date              TEXT,
    date_of_last_contact            TEXT,
    last_party_voted                TEXT,
    last_vote_date                  TEXT,
    voter_created_date              TEXT,
    mailing_street_number           TEXT,
    mailing_street_name             TEXT,
    mailing_apt_unit_number         TEXT,
    mailing_city                    TEXT,
    mailing_state                   TEXT,
    mailing_zipcode                 TEXT,
    mailing_country                 TEXT
);

CREATE TABLE IF NOT EXISTS RAW.georgia_ncoa_data_2023_09_13
(
    input_county                        TEXT,
    input_voter_registration_number     TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_address_line_1                TEXT,
    input_address_line_2                TEXT,
    input_residence_city                TEXT,
    input_residence_state               TEXT,
    input_residence_zipcode             TEXT,
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

CREATE TABLE IF NOT EXISTS RAW.georgia_voter_history
(
    county_name               TEXT,
    voter_registration_number TEXT,
    election_date             TEXT,
    election_type             TEXT,
    party                     TEXT,
    ballot_style              TEXT,
    absentee                  TEXT,
    provisional               TEXT,
    supplemental              TEXT
);

COPY INTO RAW.georgia_voters_2023_09_13
    FROM @VOTER_FILES/georgia/raw_data/file_date=2023_09_13/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.georgia_ncoa_data_2023_09_13
    FROM @VOTER_FILES/georgia/ncoa_data/file_date=2023_09_13/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.georgia_voter_history
    FROM @VOTER_FILES/georgia/voter_history/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}