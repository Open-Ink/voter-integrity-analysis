{{
    config(
        materialized='incremental',
        on_schema_change='sync_all_columns'
    )
}}

{{ add_table_to_ncoa_results(ref("georgia_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("kansas_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("michigan_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("arkansas_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("colorado_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("florida_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("iowa_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("maryland_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("nevada_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("new_hampshire_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("pennsylvania_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("wisconsin_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("ohio_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("north_carolina_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("south_carolina_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("oregon_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("montana_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("texas_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("new_jersey_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("idaho_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("mississippi_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("new_mexico_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("washington_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("louisiana_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("wyoming_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("west_virginia_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("alabama_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("colorado_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("delaware_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("nebraska_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("rhode_island_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("vermont_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("utah_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("missouri_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("oklahoma_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("tennessee_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("virginia_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref('district_of_columbia_ncoa_results')) }}
UNION
{{ add_table_to_ncoa_results(ref("connecticut_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("new_york_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("california_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("arizona_ncoa_results")) }}
UNION
{{ add_table_to_ncoa_results(ref("south_dakota_ncoa_results")) }}