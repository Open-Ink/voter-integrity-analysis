{% macro import_rhode_island_voters() %}

CREATE TABLE IF NOT EXISTS RAW.rhode_island_voters_2023_11_16
(
    voter_id                  TEXT,
    status                    TEXT,
    last_name                 TEXT,
    first_name                TEXT,
    middle_name               TEXT,
    prefix                    TEXT,
    suffix                    TEXT,
    street_number             TEXT,
    street_name               TEXT,
    street_name_2             TEXT,
    zip_code                  TEXT,
    zip4_code                 TEXT,
    city                      TEXT,
    unit                      TEXT,
    suffix_a                  TEXT,
    suffix_b                  TEXT,
    state                     TEXT,
    carrier_code              TEXT,
    postal_city               TEXT,
    mailing_street_number     TEXT,
    mailing_street_name_1     TEXT,
    mailing_street_name_2     TEXT,
    mailing_zip_code          TEXT,
    mailing_city              TEXT,
    mailing_unit              TEXT,
    mailing_suffix_a          TEXT,
    mailing_suffix_b          TEXT,
    mailing_state             TEXT,
    mailing_country           TEXT,
    mailing_carrier_code      TEXT,
    party_code                TEXT,
    special_status_code       TEXT,
    effective_date            TEXT,
    party_effective_date      TEXT,
    gender                    TEXT,
    registration_date         TEXT,
    date_of_status_change     TEXT,
    year_of_birth             TEXT,
    date_made_inactive        TEXT,
    congressional_district    TEXT,
    state_senate_district     TEXT,
    state_rep_district        TEXT,
    precinct                  TEXT,
    ward_or_council           TEXT,
    ward_district             TEXT,
    school_committee_district TEXT,
    special_district          TEXT,
    fire_district             TEXT,
    phone_number              TEXT,
    email                     TEXT
);
CREATE TABLE IF NOT EXISTS RAW.rhode_island_ncoa_results_2023_11_16
(
    input_voter_id                      TEXT,
    input_last_name                     TEXT,
    input_first_name                    TEXT,
    input_middle_name                   TEXT,
    input_suffix                        TEXT,
    input_addressline1                  TEXT,
    input_zip_code                      TEXT,
    input_city                          TEXT,
    input_addressline2                  TEXT,
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

CREATE TABLE IF NOT EXISTS RAW.RHODE_ISLAND_VOTER_HISTORY_2023_11_16
(
    VOTER_ID                  TEXT,
    LAST_NAME                 TEXT,
    FIRST_NAME                TEXT,
    MIDDLE_NAME               TEXT,
    SUFFIX                    TEXT,
    DATE_1                    TEXT,
    ELECTION_1                TEXT,
    TYPE_1                    TEXT,
    PRECINCT_1                TEXT,
    PARTY_1                   TEXT,
    DATE_2                    TEXT,
    ELECTION_2                TEXT,
    TYPE_2                    TEXT,
    PRECINCT_2                TEXT,
    PARTY_2                   TEXT,
    DATE_3                    TEXT,
    ELECTION_3                TEXT,
    TYPE_3                    TEXT,
    PRECINCT_3                TEXT,
    PARTY_3                   TEXT,
    DATE_4                    TEXT,
    ELECTION_4                TEXT,
    TYPE_4                    TEXT,
    PRECINCT_4                TEXT,
    PARTY_4                   TEXT,
    DATE_5                    TEXT,
    ELECTION_5                TEXT,
    TYPE_5                    TEXT,
    PRECINCT_5                TEXT,
    PARTY_5                   TEXT,
    DATE_6                    TEXT,
    ELECTION_6                TEXT,
    TYPE_6                    TEXT,
    PRECINCT_6                TEXT,
    PARTY_6                   TEXT,
    DATE_7                    TEXT,
    ELECTION_7                TEXT,
    TYPE_7                    TEXT,
    PRECINCT_7                TEXT,
    PARTY_7                   TEXT,
    DATE_8                    TEXT,
    ELECTION_8                TEXT,
    TYPE_8                    TEXT,
    PRECINCT_8                TEXT,
    PARTY_8                   TEXT,
    CURRENT_PARTY             TEXT,
    YEAR_OF_BIRTH             TEXT,
    STREET_NUMBER             TEXT,
    SUFFIX_A                  TEXT,
    SUFFIX_B                  TEXT,
    STREET_NAME               TEXT,
    STREET_NAME_2             TEXT,
    UNIT                      TEXT,
    CITY                      TEXT,
    POSTAL_CITY               TEXT,
    STATE                     TEXT,
    ZIP_CODE                  TEXT,
    ZIP_CODE_4                TEXT,
    CONGRESSIONAL_DISTRICT    TEXT,
    STATE_SENATE_DISTRICT     TEXT,
    STATE_REP_DISTRICT        TEXT,
    PRECINCT                  TEXT,
    WARD_OR_COUNCIL           TEXT,
    WARD_DISTRICT             TEXT,
    SCHOOL_COMMITTEE_DISTRICT TEXT,
    SPECIAL_DISTRICT          TEXT,
    FIRE_DISTRICT             TEXT,
    STATUS                    TEXT,
    PHONE_NUMBER              TEXT,
    EMAIL                     TEXT,
    DUP                       TEXT
);


COPY INTO RAW.rhode_island_voters_2023_11_16
    FROM '@VOTER_FILES/rhode island/raw_data/file_date=2023_11_16/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '|',
        SKIP_HEADER = 2, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.rhode_island_ncoa_results_2023_11_16
    FROM '@VOTER_FILES/rhode island/ncoa_data/file_date=2023_11_16/Rhode_Island_Filtered.csv'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.RHODE_ISLAND_VOTER_HISTORY_2023_11_16
    FROM '@VOTER_FILES/rhode island/voter_history/'
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '|',
        SKIP_HEADER = 2, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ('NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}