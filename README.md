# eCommerce-Promotion-Analysis


## Overview

In this project, we analyze `ga4_obfuscated_sample_ecommerce dataset`, an [obfuscated Google Analytics 4-property dataset for BigQuery](https://developers.google.com/analytics/bigquery/web-ecommerce-demo-dataset), which contains business/eCommerce data from [Google Merchandise Store](https://www.googlemerchandisestore.com/), an online store that sells Google-branded merchandise.

Our goal is to **increase purchase revenue for our eCommerce store** by analyzing data and finding out whether promotions (homepage carousels) help the business grow. If yes, how could we apply promotions to improve our business in the future?

According to our analysis, we find that **promotions on the website did help our business grow**. Therefore, we uncover various insights by analyzing the data, which can **be transformed into actions to improve the business**. 

Finally, we integrate insights we found with practice, and **create an A/B test plan** to achieve the project objective.  From data to insights, we discover opportunities and build up strategies. And from results to decisions, we make positive and profitable impacts on the company.

**Note: Please refer to `Analysis Report.docx` to get the detailed analysis process and results.**


## Key Topics

The following topics will be covered in this project:
* Get the data, dive deeper into the data, and structure our analysis
  * Advance preparation
  * Download query results for `ga4_obfuscated_sample_ecommerce dataset` as a Pandas DataFrame
  * Dig into the data and structure the customer journey funnel
* Answer the first question: "Did promotions help our business grow?"
  * Data preparation for performing exploratory data analysis 
  * Visualize the data and find insights
* Discover successful characteristics and popular item categories for future promotions
  * Create promotion-level data with metrics 
  * Identify the most popular categories (mostly viewed by customers) for each promotion
  * Visualize the data and find insights
  * Summarize key traits of those successful promotions
* Identify product preference among customers using cluster analysis
  * Data preparation for clustering
  * Conduct Cluster Analysis
  * Find insights from our analysis results
* Create promotional strategies to improve our business
  * Promotional Strategies
  * Interesting Insights
* Design an A/B test plan for launching new promotion
  * Set Up the Experiment
  * Define Goal/Success Metrics
  * Design the Experiment


## Report & Dashboards

* **`Analysis Report.docx`**
  * Analysis Structure and Outcome
* **`eCommerce Promotion Analysis.twb`**
  * Data Visualization


## Query & Codes

**`0. query_BigQuery_code.sql`**
  * SQL query for querying event data in `ga4_obfuscated_sample_ecommerce dataset` from BigQuery

**`1. data_query.ipynb`**
  * Show how we download query results as a Pandas DataFrame.
  * Export data in CSV file fomat `ecommerce_all.csv`.

**`2. data_preparation.ipynb`**
  * Conduct data processing and data aggregation to generate data for visualization and further analysis
  * Create two datasets: `ecommerce_session.csv` and `ecommerce_item.csv`.

**`3. promotional_data.ipynb`**
  * Data preparation for discovering successful characteristics and popular item categories for future promotions.
  * Generate three datasets: `promotion_metrics.csv`, `promotion_view_item_category.csv`, and `promotion_trend.csv`.

**`4. cluster_analysis.ipynb`**
  * Identify product preference among customers using cluster analysis.
  * Implement clustering on items based on product popularity and customer behavior.

**`5. calculation_for_ab_test.ipynb`**
  * Calculate parameters in the formula of getting sample size for A/B test.


## Helpful Links

* Google Cloud
  * [Create and Manage service accounts and service account keys](https://cloud.google.com/iam/docs/creating-managing-service-accounts)
  * [Create credentials with scopes](https://cloud.google.com/bigquery/docs/samples/bigquery-auth-drive-scope)
  * [Download query results to DataFrame](https://cloud.google.com/bigquery/docs/samples/bigquery-query-results-dataframe)
* GA4
  * [BigQuery Export integration](https://support.google.com/analytics/topic/9359001?hl=en&ref_topic=9306488)
  * [Introduction to Google Analytics 4: Ecommerce](https://developers.google.com/analytics/devguides/collection/ga4/ecommerce)
  * [Google Analytics 4 Events](https://developers.google.com/analytics/devguides/collection/ga4/reference/events)
