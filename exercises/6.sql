SELECT
    d.id, d.name,
    m.code, m.name,
    m.mandates,
    SUM(m.mandates) OVER (PARTITION BY m.district) AS district_total_mandates,
    SUM(m.mandates) OVER (
        PARTITION BY m.district
        ORDER BY m.mandates DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_mandates,
    (SUM(m.mandates) OVER (
        PARTITION BY m.district
        ORDER BY m.mandates DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        )*1.0) / (SUM(m.mandates) OVER (PARTITION BY m.district)*1.0) AS cumilative_share
FROM municipality m
JOIN district d ON d.id = m.district
ORDER BY d.id,m.mandates DESC, m.code
