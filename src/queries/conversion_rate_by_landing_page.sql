SELECT
  page_path,
  ROUND( ( SUM(total_transactions) / COUNT(*) ) * 100, 2) AS conversion_rate
FROM (
  SELECT
    totals.transactions AS total_transactions,
    isEntrance,
    page.pagePath AS page_path
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_2017043*`
  CROSS JOIN
    UNNEST(hits)
  WHERE
    isEntrance = TRUE )
GROUP BY
  page_path
ORDER BY
  conversion_rate DESC
  LIMIT 10