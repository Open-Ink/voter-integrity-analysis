WITH V_STATES AS (SELECT STATE_CODE
                  FROM {{ ref('all_voters') }}
                  GROUP BY STATE_CODE)
SELECT LOOKUP_STATES.CODE, LOOKUP_STATES.NAME, LOOKUP_STATES.FID
FROM V_STATES
         INNER JOIN {{ ref('all_states') }} LOOKUP_STATES ON UPPER(V_STATES.STATE_CODE) = UPPER(LOOKUP_STATES.CODE)