
  create or replace   view DBT_VOTER_DATA.cleaned.delaware_voter_history
  
   as (
    WITH  __dbt__cte__delaware_elections as (


SELECT *
FROM (VALUES ('GENERAL', '11/8/2022', 'GE2022'),
             ('PRIMARY', '9/13/2022', 'PR2022'),
             ('PRIMARY', '9/15/2020', 'PR2020'),
             ('PRESIDENTIAL PRIMARY', '7/7/2020', 'PP2020'),
             ('GENERAL', '11/3/2020', 'GE2020'),
             ('GENERAL', '11/6/2018', 'GE2018'),
             ('PRIMARY', '9/6/2018', 'PR2018'),
             ('PRESIDENTIAL PRIMARY', '4/26/2016', 'PP2016'),
             ('PRIMARY', '9/13/2016', 'PR2016'),
             ('GENERAL', '11/8/2016', 'GE2016'),
             ('GENERAL', '11/4/2014', 'GE2014'),
             ('PRIMARY', '9/9/2014', 'PR2014'),
             ('PRIMARY', '9/11/2012', 'PR2012'),
             ('GENERAL', '11/6/2012', 'GE2012'),
             ('PRESIDENTIAL PRIMARY', '4/24/2012', 'PP2012'),
             ('GENERAL', '11/9/2010', 'GE2010'),
             ('PRIMARY', '9/14/2010', 'PR2010'),
             ('PRIMARY', '9/9/2008', 'PR2008'),
             ('GENERAL', '11/4/2008', 'GE2008'),
             ('PRESIDENTIAL PRIMARY', '2/5/2008', 'PP2008'),
             ('PRIMARY', '9/12/2006', 'PR2006'),
             ('GENERAL', '11/7/2006', 'GE2006'),
             ('GENERAL', '11/2/2004', 'GE2004'),
             ('PRESIDENTIAL PRIMARY', '2/3/2004', 'PP2004'),
             ('PRIMARY', '9/11/2004', 'PR2004'),
             ('GENERAL', '11/5/2002', 'GE2002'),
             ('PRIMARY', '9/7/2002', 'PR2002'),
             ('PRESIDENTIAL PRIMARY', '2/8/2000', 'PP2000'),
             ('GENERAL', '11/7/2000', 'GE2000'),
             ('PRIMARY', '9/9/2000', 'PR2000'),
             ('PRIMARY', '9/12/1998', 'PR1998'),
             ('GENERAL', '11/3/1998', 'GE1998'),
             ('GENERAL', '11/5/1996', 'GE1996'),
             ('PRESIDENTIAL PRIMARY', '2/24/1996', 'PP1996'),
             ('GENERAL', '11/8/1994', 'GE1994'),
             ('GENERAL', '11/3/1992', 'GE1992'),
             ('GENERAL', '11/6/1990', 'GE1990'),
             ('GENERAL', '11/8/1988', 'GE1988')) AS A (ELECTION_TYPE, ELECTION_DATE, ELECTION_CODE)
), VOTER_HISTORY AS (SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_1 AS ELECTION_CODE,
                              VOTING_METHOD_1  AS VOTING_METHOD
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_1 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_2,
                              VOTING_METHOD_2
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_2 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_3,
                              VOTING_METHOD_3
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_3 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_4,
                              VOTING_METHOD_4
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_4 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_5,
                              VOTING_METHOD_5
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_5 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_6,
                              VOTING_METHOD_6
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_6 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_7,
                              VOTING_METHOD_7
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_7 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_8,
                              VOTING_METHOD_8
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_8 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_9,
                              VOTING_METHOD_9
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_9 IS NOT NULL
                       UNION ALL
                       SELECT VOTER_ID,
                              COUNTY,
                              VOTING_HISTORY_10,
                              VOTING_METHOD_10
                       FROM RAW.DELAWARE_VOTERS_2023_11_17
                       WHERE VOTING_HISTORY_10 IS NOT NULL)
SELECT 'DE'                                   AS STATE_CODE,
       VH.VOTER_ID                            AS VOTER_ID,
       VH.COUNTY                              AS COUNTY_CODE,
       TO_DATE(E.ELECTION_DATE, 'MM/DD/YYYY') AS ELECTION_DATE,
       E.ELECTION_TYPE                        AS ELECTION_TYPE,
       NULL                                   AS PARTY_VOTED,
       CASE
           WHEN VOTING_METHOD = 'P' THEN 'STANDARD'
           WHEN VOTING_METHOD = 'A' THEN 'ABSENTEE'
           WHEN VOTING_METHOD = 'E' THEN 'EARLY_VOTING'
           WHEN VOTING_METHOD = 'V' THEN 'PROVISIONAL'
           END                                AS VOTING_METHOD,
       NULL                                   AS DATE_OF_VOTING,
       TRUE                                   AS WAS_VOTE_COUNTED,
       NULL::object                           AS ADDITIONAL_DATA
FROM VOTER_HISTORY VH
         INNER JOIN __dbt__cte__delaware_elections E
                    ON VH.ELECTION_CODE = E.ELECTION_CODE
  );

