SELECT
  FORMAT_DATE("%A", PARSE_DATE("%Y%m%d", date)) AS weekday,
  SUM(totals.totalTransactionRevenue) / 1000000 as total_revenue
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  GROUP BY weekday 
  ORDER BY total_revenue DESC
  LIMIT 7