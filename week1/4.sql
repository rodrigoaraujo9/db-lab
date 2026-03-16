SELECT
  d.id   AS district_id,
  d.name AS district_name,
  m.code AS municipality_code,
  m.name AS municipality_name,
  m.mandates,
  SUM(m.mandates) OVER (PARTITION BY d.id) AS district_total_mandates,
  (m.mandates*1.0
   / NULLIF(SUM(m.mandates) OVER (PARTITION BY d.id), 0)
  ) AS mandates_share
FROM municipality m
JOIN district d
  ON d.id = m.district
ORDER BY d.id, m.code;
