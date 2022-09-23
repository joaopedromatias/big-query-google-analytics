SELECT
  channelGrouping,
  ROUND( ( SUM(totals.transactions) / COUNT(*) ) * 100, 2) AS conversion_rate,
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
  channelGrouping
ORDER BY
  conversion_rate DESC