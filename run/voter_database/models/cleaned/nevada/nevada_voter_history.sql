
  create or replace   view DBT_VOTER_DATA.cleaned.nevada_voter_history
  
   as (
    SELECT 'NV'                 AS STATE_CODE,
       V.RESIDENTIAL_COUNTY AS COUNTY_CODE,
       VH.VOTER_ID          AS VOTER_ID,
       'Unknown'            AS ELECTION_TYPE,
       ELECTION_DATE::date  AS ELECTION_DATE,
       NULL                 AS PARTY_VOTED,
       CASE
           WHEN VOTE_CODE IN ('EV') THEN 'EARLY_VOTING'
           WHEN VOTE_CODE IN ('MB') THEN 'ABSENTEE'
           ELSE 'STANDARD'
           END              AS VOTING_METHOD,
       NULL                 AS DATE_OF_VOTING,
       TRUE                 AS WAS_VOTE_COUNTED,
       NULL::object         AS ADDITIONAL_DATA
FROM RAW.NEVADA_VOTER_HISTORY_2023_07_31 VH
         LEFT JOIN RAW.NEVADA_VOTERS_2023_07_31 V ON V.VOTER_ID = VH.VOTER_ID
  );

