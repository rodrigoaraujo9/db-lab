SELECT
    d.id,
    d.name,
    COUNT(m.code) AS total_municipalities,
    COUNT(m.code) FILTER (WHERE m.mandates > 10) AS municipalities_above_10_mandates
FROM district d
JOIN municipality m ON m.district = d.id
GROUP BY d.id, d.name
ORDER BY d.id;
