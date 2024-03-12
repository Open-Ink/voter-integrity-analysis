select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- We need to make sure that the number of counties in the dim county table match the number of counties in the
-- all_counties table for every state

WITH LOADED_COUNTIES AS
         (SELECT GEOID, DIM_STATE.FID, DIM_COUNTY.NAME
          FROM DBT_VOTER_DATA.normalized.dim_county
                   INNER JOIN DBT_VOTER_DATA.normalized.dim_state ON DIM_COUNTY.STATE_CODE = DIM_STATE.CODE)

SELECT *
FROM LOADED_COUNTIES L_C
WHERE NOT EXISTS (SELECT 1 FROM DBT_VOTER_DATA.lookups.all_counties A_C WHERE A_C.GEOID = L_C.GEOID)
      
    ) dbt_internal_test