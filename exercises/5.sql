WITH all_votes AS (
  -- parties
  SELECT
    m.district::smallint AS district_id,
    'party'              AS category,
    pv.votes             AS votes
  FROM party_votes pv
  JOIN municipality m ON m.code = pv.municipality_code

  UNION ALL

  -- coalitions
  SELECT
    m.district::smallint AS district_id,
    'coalition'          AS category,
    c.votes              AS votes
  FROM coalition c
  JOIN municipality m ON m.code = c.municipality_code

  UNION ALL

  -- independents
  SELECT
    m.district::smallint AS district_id,
    'independent'        AS category,
    i.votes              AS votes
  FROM independent i
  JOIN municipality m ON m.code = i.municipality_code
)
SELECT
  d.id   AS district_id,
  d.name AS district_name,

  SUM(av.votes) FILTER (WHERE av.category = 'party')       AS party_votes,
  SUM(av.votes) FILTER (WHERE av.category = 'coalition')   AS coalition_votes,
  SUM(av.votes) FILTER (WHERE av.category = 'independent') AS independent_votes,

  SUM(av.votes) AS total_votes
FROM district d
LEFT JOIN all_votes av
  ON av.district_id = d.id
GROUP BY d.id, d.name
ORDER BY d.id;
