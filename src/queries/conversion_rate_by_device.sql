SELECT
  device.deviceCategory as device,
  ROUND( ( SUM(totals.transactions) / COUNT(*) ) * 100, 2) as conversion_rate, 
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  GROUP BY device
  ORDER BY conversion_rate DESC