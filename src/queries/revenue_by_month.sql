SELECT
  FORMAT_DATE("%B", PARSE_DATE("%Y%m%d", date)) AS month,
  SUM(totals.totalTransactionRevenue) / 1000000 as total_revenue
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  GROUP BY month
  ORDER BY total_revenue DESC
  LIMIT 12