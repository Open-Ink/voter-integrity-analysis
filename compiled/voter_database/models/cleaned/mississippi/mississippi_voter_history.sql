SELECT 'MS'                AS STATE_CODE,
       V.RES_COUNTY        AS COUNTY_CODE,
       VH.MAPPING_VALUE    AS VOTER_ID,
       ELECTION_TYPE       AS ELECTION_TYPE,
       ELECTION_DATE::date AS ELECTION_DATE,
       POLITICAL_PARTY     AS PARTY_VOTED,
       NULL                AS VOTING_METHOD,
       NULL                AS DATE_OF_VOTING,
       TRUE                AS WAS_VOTE_COUNTED,
       NULL::object        AS ADDITIONAL_DATA
FROM DBT_VOTER_DATA.raw.MISSISSIPPI_VOTER_HISTORY_2023_12_11 VH
         INNER JOIN DBT_VOTER_DATA.raw.MISSISSIPPI_RAW_DATA_2023_12_11 VH V ON V.MAPPING_VALUE = VH.MAPPING_VALUE
WHERE RES_COUNTY IS NOT NULL
  AND ELECTION_DATE IS NOT NULL