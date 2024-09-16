with promoted_tweets as (
    select
        __insert_date,
        CAST(campaign_id as STRING) as campaign_id,
        channel,
        url,
        text,
        clicks,
        comments,
        date,	
        engagements,	
        impressions,	
        likes,	
        url_clicks,	
        retweets as shares,
        spend,	
        video_total_views,	
    from {{ ref("src_promoted_tweets_twitter_all_data") }}
)

select *
from promoted_tweets
