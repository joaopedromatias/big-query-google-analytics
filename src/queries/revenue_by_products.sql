SELECT
  p.V2ProductName as product_name,
  ROUND(SUM(p.productRevenue) / 1000000, 2) as product_revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017041*`,
  UNNEST(hits) AS h,
  UNNEST(h.product) AS p
  GROUP BY product_name
  ORDER BY product_revenue DESC
  LIMIT 10