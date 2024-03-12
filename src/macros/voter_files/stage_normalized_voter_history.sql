{% macro import_normalized_voter_history() %}

CREATE SCHEMA IF NOT EXISTS AVI_SANDBOX;

CREATE TABLE IF NOT EXISTS AVI_SANDBOX.VOTER_HISTORY
(
    election_id      INT,
    state_code       TEXT,
    voter_id         TEXT,
    voting_method    TEXT,
    was_vote_counted BOOLEAN,
    vote_date        TEXT
);

COPY INTO AVI_SANDBOX.VOTER_HISTORY
    FROM @{{target.schema}}.VOTER_FILES/voter_history/VoterHistory.csv
    FILE_FORMAT = (
        TYPE = 'CSV', FIELD_OPTIONALLY_ENCLOSED_BY = '"', FIELD_DELIMITER = '\t',
        SKIP_HEADER = 1, ESCAPE_UNENCLOSED_FIELD = NONE, TRIM_SPACE = TRUE,
        EMPTY_FIELD_AS_NULL = TRUE, NULL_IF = ( 'NULL', '')
        )
    ON_ERROR = 'CONTINUE'

{% endmacro %}