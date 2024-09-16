with
    creative_facebook as (
        select
            __insert_date,
            cast(ad_id as string) as ad_id,
            add_to_cart,
            cast(adset_id as string) as adset_id,
            cast(campaign_id as string) as campaign_id,
            channel,
            clicks,
            comments,
            cast(creative_id as string) as creative_id,
            creative_title,
            objective,
            buying_type,
            campaign_type,
            creative_body,
            date,
            likes,
            shares,
            comments_2,
            views,
            clicks_2,
            impressions,
            mobile_app_install,
            inline_link_clicks,
            purchase as total_conversions,
            complete_registration,
            purchase_value,
            shares_2,
            spend,
            purchase_2,
            views_2,

        from {{ ref("src_ads_creative_facebook_all_data") }}
    )

select *
from creative_facebook
