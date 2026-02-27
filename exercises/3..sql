SELECT
    d.id, d.name,
    m.code, m.name,
    m.mandates,
    RANK() OVER (PARTITION BY m.district ORDER BY m.mandates DESC) AS rank_in_district,
    DENSE_RANK() OVER (PARTITION BY m.district ORDER BY m.mandates DESC) AS dense_rank_in_district
FROM municipality m
JOIN district d ON m.district = d.id
ORDER BY d.id, rank_in_district;
