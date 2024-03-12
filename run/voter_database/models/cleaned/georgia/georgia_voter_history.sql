
  create or replace   view DBT_VOTER_DATA.cleaned.georgia_voter_history
  
   as (
    SELECT 'GA'                      AS STATE_CODE,
       COUNTY_NAME               AS COUNTY_CODE,
       VOTER_REGISTRATION_NUMBER AS VOTER_ID,
       ELECTION_TYPE,
       ELECTION_DATE::date       AS ELECTION_DATE,
       PARTY                     AS PARTY_VOTED,
       CASE
           WHEN BALLOT_STYLE IN ('EARLY', 'EARLY IN-PERSON') THEN 'EARLY_VOTING'
           WHEN BALLOT_STYLE IN ('MAIL IN', 'ABSENTEE BY MAIL', 'ABSENTEE') THEN 'ABSENTEE'
           ELSE 'STANDARD'
           END                   AS VOTING_METHOD,
       NULL                      AS DATE_OF_VOTING,
       TRUE                      AS WAS_VOTE_COUNTED,
       NULL::object              AS ADDITIONAL_DATA
FROM RAW.GEORGIA_VOTER_HISTORY
WHERE COUNTY_NAME IS NOT NULL
  AND VOTER_REGISTRATION_NUMBER IS NOT NULL
  );

