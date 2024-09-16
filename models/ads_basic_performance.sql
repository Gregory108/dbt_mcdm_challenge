{% set sql_statement %}
    select
        mcdm_field_name AS name,
        mcdm_field_value_type AS type,
    from {{ ref('mcdm_paid_ads_basic_performance_structure') }}
{% endset %}

{%- set mcdm_fields = dbt_utils.get_query_results_as_dict(sql_statement) -%}

{% set bing_relation = ref("base_bing__ads") %}
{% set facebook_relation = ref("stg_facebook__ads") %}
{% set twitter_tweets_relation = ref("base_twitter__tweets") %}
{% set tiktok_relation = ref("base_tiktok__ads") %}

with
    bing_ads as (
        select
            {{
                select_present_complete_with_missing_columns(
                    bing_relation, mcdm_fields["name"], mcdm_fields["type"]
                )
            }}
        from {{ bing_relation }}
    ),
    facebook_ads as (
        select
            {{
                select_present_complete_with_missing_columns(
                    facebook_relation, mcdm_fields["name"], mcdm_fields["type"]
                )
            }}
        from {{ facebook_relation }}
    ),
    twitter_tweets as (
        select
            {{
                select_present_complete_with_missing_columns(
                    twitter_tweets_relation, mcdm_fields["name"], mcdm_fields["type"]
                )
            }}
        from {{ twitter_tweets_relation }}
    ),
    tiktok_ads as (
        select
            {{
                select_present_complete_with_missing_columns(
                    tiktok_relation, mcdm_fields["name"], mcdm_fields["type"]
                )
            }}
        from {{ tiktok_relation }}
    ),

    union_ads as (
        select *,
        from bing_ads

        union all

        select *,
        from facebook_ads

        union all

        select *,
        from tiktok_ads

        union all

        select *,
        from twitter_tweets
    )

select {% for field_name in mcdm_fields["name"] %} {{ field_name }}, {% endfor %}
from union_ads
