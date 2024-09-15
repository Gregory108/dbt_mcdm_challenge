with
    bing as (
        select
            cast(ad_id as string) as ad_id,

            cast(campaign_id as string) as campaign_id,
            channel,
            clicks,
            date,
            spend,

            null as add_to_cart,

            imps as impressions,
            conv as conversions,

            null as comments,
            null as likes,
            null as shares,
            null as views,

        from {{ ref("src_ads_bing_all_data") }}
    ),
    creative_facebook as (
        select
            cast(ad_id as string) as ad_id,

            cast(campaign_id as string) as campaign_id,
            channel,
            clicks,
            date,
            spend,

            add_to_cart,

            impressions,
            purchase as conversions,

            comments,
            likes,
            shares,
            views,

        from {{ ref("src_ads_creative_facebook_all_data") }}
    ),
    tiktok_ads as (
        select
            cast(ad_id as string) as ad_id,

            cast(campaign_id as string) as campaign_id,
            channel,
            clicks,
            date,
            spend,

            add_to_cart,

            impressions,
            conversions,

            null as comments,
            null as likes,
            null as shares,
            null as views,

        from {{ ref("src_ads_tiktok_ads_all_data") }}
    ),
    promoted_tweets as (
        select
            cast(null as string) as ad_id,

            cast(campaign_id as string) as campaign_id,
            channel,
            clicks,
            date,
            spend,

            null as add_to_cart,

            impressions,
            null as conversions,

            comments,
            likes,
            retweets as shares,
            NULL as views,

        from {{ ref("src_promoted_tweets_twitter_all_data") }}
    ),

    union_ads as (
        select *
        from bing

        union all

        select *
        from creative_facebook

        union all

        select *
        from tiktok_ads

        union all

        select *
        from promoted_tweets
    )

select
    *,
    views + comments + clicks + likes + shares as engagements  -- + comments + likes + shares + views as engagements
from union_ads
