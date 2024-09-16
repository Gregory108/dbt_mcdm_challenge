with
    ticktok_ads as (
        select
            __insert_date,
            cast(ad_id as string) as ad_id,
            add_to_cart,
            cast(adgroup_id as string) as adgroup_id,
            cast(campaign_id as string) as campaign_id,
            channel,
            clicks,
            date,
            impressions,
            rt_installs,
            skan_app_install,
            ad_status,
            ad_text,
            purchase,  -- wonder why purchase is not `total_conversions` as it is for facebook
            registrations,
            spend,
            conversions as total_conversions,
            skan_conversion,
            video_views,
        from {{ ref("src_ads_tiktok_ads_all_data") }}
    )

select *
from ticktok_ads
