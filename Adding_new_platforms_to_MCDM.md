# A brief set of instructions (in a markdown file in your repo) for adding data from new ad platforms into your MCDM.

1. If it is a seed, run `dbt seed`, else, do what is necessary to establish a connection
2. Create a `base_(new_source_name)__(ad_entity)` model, that limis itself to [DBT convention](https://docs.getdbt.com/best-practices/how-we-structure/2-staging#staging-models), i.e.:
  - rename
  - cast types
    - Conventionally for this repo `_id` variables are cast to `string` type
  - drop test/irrelevant/garbage rows
  - Good practice is to keep `base_` models solely for variables that are present in the source.
3. If there is source-specific (re-)definition of some field (aka column/variable/dimension), create a `stg_(new_source_name)__(ad_entity)` model. Do necessary transformations there.
4. In `models/ads_basic_performance.sql`
  - add jijna script `{{ set source_name_relation = ref("(base/stg)_(new_source_name)__(ad_entity)") }}`
  - copy a CTE present for another sources and in it
    - name CTE like `(new_source_name)`
    - replace `(another_source)_relation` with the new one (two places)
  - in the `union_ads` CTE, add `union all select * from {{ (new_source_name) }}`
5. Save and run `dbt build --select +ads_basic_performance+`
6. In Looker Studio refresh the data. If there are no changes to MCDM fields, it should work. If new source has a proper `channel` variable with distinct value, a new bar (or placeholder) should become visible.
