{% macro delete_state_data(state_code) %}

{% set sql %}

DELETE
FROM {{ ref("all_voters") }}
WHERE STATE_CODE = '{{ state_code }}';

DELETE
FROM {{ ref("all_voter_history") }}
WHERE STATE_CODE = '{{ state_code }}';

DELETE
FROM {{ ref("all_voters_ncoa") }}
WHERE INPUT_STATE = '{{ state_code }}';

DELETE
FROM {{ ref("dim_county") }}
WHERE STATE_CODE = '{{ state_code }}';

DELETE
FROM {{ ref("dim_voter_info") }}
WHERE STATE_CODE = '{{ state_code }}';

DELETE
FROM {{ref("dim_address")}}
WHERE SOURCE_STATE = '{{ state_code }}';

DELETE
FROM {{ref("fact_voters")}}
WHERE STATE_CODE = '{{ state_code }}'

{% endset %}

{#{% do log("DELETING STATE " ~ var('state_code'), info=True) %}#}

{% do run_query(sql) %}
{% do log("State Deleted", info=True) %}

{% endmacro %}