SELECT
  channelGrouping,
  ROUND( ( SUM(totals.bounces) / COUNT(*) ) * 100, 2 ) AS bounce_rate
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
  channelGrouping
ORDER BY
  bounce_rate DESC