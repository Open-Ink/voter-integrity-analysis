
  
    

        create or replace transient table DBT_VOTER_DATA.normalized.dim_state
         as
        (WITH V_STATES AS (SELECT STATE_CODE
                  FROM DBT_VOTER_DATA.cleaned.all_voters
                  GROUP BY STATE_CODE)
SELECT LOOKUP_STATES.CODE, LOOKUP_STATES.NAME, LOOKUP_STATES.FID
FROM V_STATES
         INNER JOIN DBT_VOTER_DATA.lookups.all_states LOOKUP_STATES ON UPPER(V_STATES.STATE_CODE) = UPPER(LOOKUP_STATES.CODE)
        );
      
  