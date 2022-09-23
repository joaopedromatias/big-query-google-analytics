SELECT
  FORMAT_DATE("%A", PARSE_DATE("%Y%m%d", date)) AS weekday,
  COUNT(*) as visits
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
    CROSS JOIN UNNEST(hits)
  WHERE isEntrance = true
  GROUP BY weekday
  ORDER BY visits DESC
  LIMIT 7