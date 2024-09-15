with bing as (
    select
        * EXCEPT (imps, conv),
        imps AS impressions,
        conv AS conversions       
    FROM {{ ref("src_ads_bing_all_data") }}
)