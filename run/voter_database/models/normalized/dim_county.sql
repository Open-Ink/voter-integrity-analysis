
  
    

        create or replace transient table DBT_VOTER_DATA.normalized.dim_county
         as
        (WITH V_COUNTIES AS (SELECT STATE_CODE, COUNTY_CODE
                    FROM DBT_VOTER_DATA.cleaned.all_voters
                    GROUP BY STATE_CODE, COUNTY_CODE)
SELECT ALL_STATES.CODE || '_' || V_COUNTIES.COUNTY_CODE AS COUNTY_ID,
       ALL_STATES.CODE                                  AS STATE_CODE,
       V_COUNTIES.COUNTY_CODE,
       ALL_COUNTIES.NAME,
       ALL_COUNTIES.GEOID,
       ALL_COUNTIES.COUNTYFP
FROM V_COUNTIES
         INNER JOIN DBT_VOTER_DATA.lookups.all_states ALL_STATES ON ALL_STATES.CODE = V_COUNTIES.STATE_CODE
         INNER JOIN DBT_VOTER_DATA.lookups.all_counties ALL_COUNTIES
                    ON UPPER(V_COUNTIES.COUNTY_CODE) = UPPER(ALL_COUNTIES.NAME) AND
                       ALL_COUNTIES.STATEFP = ALL_STATES.FID
        );
      
  