
  create or replace   view DBT_VOTER_DATA.cleaned.california_voter_history
  
   as (
    SELECT 'CA'          AS STATE_CODE,
       REGISTRANT_ID AS VOTER_ID,
       C.COUNTY_NAME AS COUNTY_CODE,
       ELECTION_DATE AS ELECTION_DATE,
       ELECTION_TYPE AS ELECTION_TYPE,
       NULL          AS PARTY_VOTED,
       CASE
           WHEN METHOD IN ('POLL', 'VCR', 'VBM') THEN 'STANDARD'
           WHEN METHOD = 'VBM' THEN 'ABSENTEE'
           WHEN METHOD = 'E' THEN 'ERLY'
           ELSE 'OTHER'
           END       AS VOTING_METHOD,
       NULL          AS DATE_OF_VOTING,
       TRUE          AS WAS_VOTE_COUNTED,
       NULL:null     AS ADDITIONAL_DATA
FROM RAW.CALIFORNIA_VOTER_HISTORY_2024_02_05 VH
         INNER JOIN DBT_VOTER_DATA.cleaned.california_counties C
                    ON VH.COUNTY_CODE = C.COUNTY_CODE
WHERE ELECTION_TYPE_DESC IN (
                             'PRESIDENTIAL GENERAL',
                             'PRESIDENTIAL PRIMARY'
    )
  );

