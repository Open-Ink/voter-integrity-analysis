{% macro import_montana_voters() %}

CREATE TABLE IF NOT EXISTS RAW.montana_voters_2023_11_06
(
    vtrid               TEXT,
    first_name          TEXT,
    middle_name         TEXT,
    last_name           TEXT,
    voter_status        TEXT,
    voter_status_reason TEXT,
    ra_hs_num           TEXT,
    ra_street_name      TEXT,
    ra_sttype           TEXT,
    ra_stdir_code       TEXT,
    ra_stdir_code_post  TEXT,
    ra_utyp_code        TEXT,
    ra_unit_num         TEXT,
    ra_city             TEXT,
    ra_state            TEXT,
    ra_zip_code         TEXT,
    residence_address   TEXT,
    ma_addr_line_1      TEXT,
    ma_city             TEXT,
    ma_state            TEXT,
    ma_zip_code         TEXT,
    ma_zip_plus         TEXT,
    mailing_address     TEXT,
    phone_no            TEXT,
    dob                 TEXT,
    vote_eligible_date  TEXT,
    current_county      TEXT,
    precinct            TEXT,
    congress_district   TEXT,
    house_district      TEXT,
    senate_district     TEXT,
    prec_code           TEXT,
    absentee            TEXT,
    ward                TEXT,
    city_limits         TEXT
);
CREATE TABLE IF NOT EXISTS RAW.montana_ncoa_results_2023_11_06
(
    input_vtrid
        TEXT,
    input_firstname
        TEXT,
    input_middlename
        TEXT,
    input_lastname
        TEXT,
    input_addressline1
        TEXT,
    input_addressline2
        TEXT,
    input_ra_city
        TEXT,
    input_ra_state
        TEXT,
    input_ra_zip_code
        TEXT,
    input_current_county
        TEXT,
    household_position
        TEXT,
    name_id
        TEXT,
    individual_record_id
        TEXT,
    first_name
        TEXT,
    last_name
        TEXT,
    company_name
        TEXT,
    street_number
        TEXT,
    street_pre_direction
        TEXT,
    street_name
        TEXT,
    street_post_direction
        TEXT,
    street_suffix
        TEXT,
    unit_type
        TEXT,
    unit_number
        TEXT,
    box_number
        TEXT,
    city_name
        TEXT,
    state_code
        TEXT,
    postal_code
        TEXT,
    postal_code_extension
        TEXT,
    carrier_route
        TEXT,
    address_status
        TEXT,
    error_number
        TEXT,
    address_type
        TEXT,
    delivery_point
        TEXT,
    check_digit
        TEXT,
    delivery_point_verification
        TEXT,
    delivery_point_verification_notes
        TEXT,
    vacant
        TEXT,
    congressional_district_code
        TEXT,
    area_code
        TEXT,
    latitude
        TEXT,
    longitude
        TEXT,
    time_zone
        TEXT,
    county_name
        TEXT,
    county_fips
        TEXT,
    state_fips
        TEXT,
    barcode
        TEXT,
    locatable_address_conversion_system
        TEXT,
    line_of_travel
        TEXT,
    ascending_or_descending
        TEXT,
    move_applied
        TEXT,
    move_type
        TEXT,
    move_date
        TEXT,
    move_distance
        TEXT,
    match_flag
        TEXT,
    nxi
        TEXT,
    ank
        TEXT,
    residential_delivery_indicator
        TEXT,
    record_type
        TEXT,
    country_code
        TEXT,
    address_line_1
        TEXT,
    address_line_2
        TEXT,
    address_id
        TEXT,
    household_id
        TEXT,
    individual_id
        TEXT
);

CREATE TABLE IF NOT EXISTS RAW.MONTANA_VOTER_HISTORY_2023_11_06
(
    Voter_ID             TEXT,
    Election_Type        TEXT,
    Election_Date        TEXT,
    Election_Description TEXT,
    E_JS_CODE            TEXT,
    VVM_ID               TEXT,
    Sent_Date            TEXT,
    Receive_Date         TEXT,
    BallotStage_Status   TEXT
);


COPY INTO RAW.montana_voters_2023_11_06
    FROM @VOTER_FILES/montana/raw_data/file_date=2023_11_06/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.montana_ncoa_results_2023_11_06
    FROM @VOTER_FILES/montana/ncoa_data/file_date=2023_11_06/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = ',',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT';

COPY INTO RAW.MONTANA_VOTER_HISTORY_2023_11_06
    FROM @VOTER_FILES/montana/voter_history/
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'ABORT_STATEMENT'

{% endmacro %}