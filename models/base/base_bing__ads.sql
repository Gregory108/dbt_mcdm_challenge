with
    bing as (
        select
            __insert_date,
            cast(ad_id as string) as ad_id,
            cast(adset_id as string) as adset_id,
            cast(campaign_id as string) as campaign_id,
            channel,
            ad_description,
            title_part_1,
            title_part_2,
            clicks,
            date,
            imps as impressions,
            revenue,
            spend,
            conv as total_conversions,

        from {{ ref("src_ads_bing_all_data") }}
    )

select *
from bing
