# Marketing Common Data Modelling Challenge

Welcome to the Marketing Common Data Modelling Challenge!

## Task

At Improvado, we use Marketing Common Data Models (MCDM) to map data from various ad platforms into a single model. MCDM helps marketers answer questions like: "Where are the clicks better, on Facebook or TikTok?"

Imagine the MCDM model behind a dashboard is somehow lost. You need to rebuild it. You have:
- Raw data from the ad systems (located in the `seeds` folder),
- The MCDM table structure for this report,
- [The dashboard](https://lookerstudio.google.com/reporting/fa668749-b82f-41a8-a12e-f7d9c0733b57/page/tEnnC).

To help guide you through this process, here's a checklist you can follow (or not):
- Begin a new project in dbt Cloud, utilizing Google Big Query as the data warehouse (DWH).
- Use the raw data from the ad platforms and the MCDM table structure to create the `ads_basic_performance` report.

### How to Submit

Please provide your answer using the [Typeform link](https://improvado.typeform.com/to/efqlu4kP). Include the following:
- A link to your dbt Cloud repository containing the completed MCDM for the `ads_basic_performance` report.
- A link to the recreated dashboard.
- A brief set of instructions (in a markdown file in your repo) for adding data from new ad platforms into your MCDM.

## Hints

Here are some helpful tips:
- **Cost per engagement** is the total spent divided by the number of engagements.
- **Conversion cost** is calculated by dividing the total `spended` by the number of conversions.
- **Impressions by channel** is the sum of impressions for each channel.
- **CPC (Cost per Click)** is calculated by dividing the total `spended` by the number of clicks.

### Tools

To complete this task, you might need the following tools:
- dbt Cloud
- Google Big Query
- Google Looker Studio

### Tool Instructions

Here are some resources to help you get started with the necessary tools:
- **dbt Courses**:
    - [dbt Fundamentals](https://courses.getdbt.com/courses/fundamentals) – relevant chapters include:
        - Setting up dbt Cloud (17 minutes)
        - Models and Sources (40 minutes)
    - [dbt Cloud and BigQuery for Admins](https://courses.getdbt.com/courses/dbt-cloud-and-bigquery-for-admins) (35 minutes)
- [How to Use Google BigQuery for FREE](https://levelup.gitconnected.com/how-to-use-google-bigquery-for-free-9c2a65e3a78c#)
- **How to create a dashboard in Google Looker Studio with Google BigQuery**:
    - ![](https://github.com/technomonah/dbt_mcdm_challenge/blob/main/how_to_export_gbq_to_looker.gif)

### Additional Resources:

- Learn more about dbt [in the documentation](https://docs.getdbt.com/docs/introduction).
- [Short overview](https://improvado.io/products/mcdm) of Improvado MCDM.

### How to Use the Repository

This repository serves as the foundation for your project. Clone it and start your dbt Cloud project from here.

The repository includes raw data from various ad platforms, as well as the MCDM structure for the `ads_basic_performance` report, provided as seeds:

- `src_ads_bing_all_data`
- `src_ads_creative_facebook_all_data`
- `src_ads_tiktok_ads_all_data`
- `src_promoted_tweets_twitter_all_data`
- `mcdm_paid_ads_basic_performance_structure`

To build the seeds, run `dbt seed` in the dbt Cloud console. Once the seeds have been built, you can access the data using `ref()`. For example, you can use `SELECT * FROM {{ ref('src_ads_bing_all_data') }}` to access data from the `src_ads_bing_all_data` seed.

### Q&A

**Q**: How do I validate the results for my model?  
**A**: Compare your dashboard with the dashboard from the task. If some numbers don't match, then some fields in your model are incorrectly mapped.

**Q**: What if there's no MCDM structure field in the raw data source?  
**A**: You're starting to understand the main goal of this task! Suggest which field or fields correspond to the MCDM ones by their meaning. If no such fields exist, the data source probably doesn't contain them.
