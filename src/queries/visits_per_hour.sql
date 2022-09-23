SELECT
  hour,
  COUNT(*) as visits
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_20161125`
    CROSS JOIN UNNEST(hits)
  WHERE isEntrance = true
  GROUP BY hour
  ORDER BY visits DESC
  LIMIT 24