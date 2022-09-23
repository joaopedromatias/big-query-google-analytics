SELECT
  device.deviceCategory AS device,
  ROUND( ( SUM(totals.bounces) / COUNT(*) ) * 100, 2 ) AS bounce_rate
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
  device
ORDER BY
  bounce_rate DESC