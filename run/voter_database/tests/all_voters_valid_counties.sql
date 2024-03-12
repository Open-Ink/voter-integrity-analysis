select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      WITH COUNTIES AS
         (SELECT C.NAME, S.CODE AS STATE_CODE
          FROM DBT_VOTER_DATA.lookups.all_counties C
                   INNER JOIN DBT_VOTER_DATA.lookups.all_states S ON C.STATEFP = S.FID)

SELECT *
FROM DBT_VOTER_DATA.cleaned.all_voters V
WHERE NOT EXISTS (SELECT 1 FROM COUNTIES C WHERE C.STATE_CODE = V.STATE_CODE AND UPPER(C.NAME) = UPPER(V.COUNTY_CODE))
      
    ) dbt_internal_test