SELECT
  page_path as landing_page,
  ROUND( ( SUM(total_transactions) / COUNT(*) ) * 100, 2) AS conversion_rate
FROM (
  SELECT
    totals.transactions AS total_transactions,
    isEntrance,
    page.pagePath AS page_path
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  CROSS JOIN
    UNNEST(hits)
  WHERE
    isEntrance = TRUE )
GROUP BY
  landing_page
ORDER BY
  conversion_rate DESC
  LIMIT 20