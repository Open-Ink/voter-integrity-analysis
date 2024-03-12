select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT SUM(COUNT)                      AS COUNT,
       SUM(DID_MOVE)                   AS DID_MOVE,
       SUM(DID_MOVE_TO_ANOTHER_COUNTY) AS DID_MOVE_TO_ANOTHER_COUNTY,
       SUM(DID_MOVE_TO_ANOTHER_STATE)  AS DID_MOVE_TO_ANOTHER_STATE
FROM DBT_VOTER_DATA.normalized.dim_state S
         LEFT JOIN DBT_VOTER_DATA.normalized.fact_voters V ON S.CODE = V.STATE_CODE
GROUP BY S.CODE
HAVING SUM(COUNT) = 0
    OR SUM(DID_MOVE) = 0
    OR SUM(DID_MOVE_TO_ANOTHER_COUNTY) = 0
    OR SUM(DID_MOVE_TO_ANOTHER_STATE) = 0
      
    ) dbt_internal_test