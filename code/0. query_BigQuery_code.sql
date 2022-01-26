SELECT DISTINCT
    event_date,    
    FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_MICROS(event_timestamp)) AS event_time,

    -- user demo/device
    user_pseudo_id,
    geo.continent,
    geo.sub_continent,
    geo.country,
    geo.region,
    geo.city,
    device.category AS device_category,
    device.mobile_brand_name,
    device.mobile_model_name,
    device.operating_system,
    -- device.is_limited_ad_tracking,
    device.web_info.browser AS web_browser,

    user_ltv.revenue,   -- 此customer累積購買金額(會隨著新交易增加)
    -- user_ltv.currency,

    -- traffic source
    traffic_source.name AS traffic_name,
    traffic_source.medium AS traffic_medium,
    traffic_source.source AS traffic_source,

    -- event
    (SELECT value.int_value FROM UNNEST(event_params) WHERE key = "ga_session_id") AS ga_session_id,
    event_name,
    event_value_in_usd,  -- 此交易總收益＊
    (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "page_title") AS page_title,
    (SELECT value.string_value FROM UNNEST(event_params) WHERE key = "page_location") AS page_location,
    ((SELECT value.int_value FROM UNNEST(event_params) WHERE key = "engagement_time_msec"))/1000 AS engagement_time_sec,

    -- ecommerce (event_name == purchase) / (event_name == begin_to_checkout)
    ecommerce.total_item_quantity,  -- 此交易總產品數量(重複計算) / 結帳時所選擇的總產品數量(total quantity among all items)
    ecommerce.purchase_revenue_in_usd,  -- 此交易總收益＊
    -- ecommerce.refund_value_in_usd,
    ecommerce.unique_items,  -- 此交易總產品種類數目(不重複計算) / 結帳時所選擇的總產品種類數目(distinct count of product)
    ecommerce.transaction_id,  -- purchase才會有

    -- items
    items.item_id,
    items.item_name,
    items.item_brand,
    item_variant,
    items.item_category,
    -- items.item_category2,
    -- items.item_category3,
    -- items.item_category4,
    -- items.item_category5,
    items.price_in_usd,  -- 各產品之價格
    items.quantity,  -- 各產品之購買數量
    items.item_revenue_in_usd,  -- 各產品之收益(價格*購買數量)
    -- items.item_refund_in_usd,
    -- items.coupon,
    -- items.affiliation,
    -- items.item_list_name,
    items.item_list_index,

    -- promotion
    -- items.promotion_id,
    items.promotion_name,
    -- items.creative_name,
    -- items.creative_slot


FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`, UNNEST (items) AS items