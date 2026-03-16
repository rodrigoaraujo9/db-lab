WITH RECURSIVE
lists_porto AS (
    SELECT
        m.code, m.name,
        p.shortname,
        pv.votes,
        'party' AS list_type
    FROM municipality m
    JOIN party_votes pv ON pv.municipality_code = m.code
    JOIN party p ON p.id = pv.party_id
    WHERE m.name = 'PORTO'

    UNION ALL

    SELECT
    m.code, m.name,
    i.shortname,
    i.votes,
    'independent' AS list_type
    FROM municipality m
    JOIN independent i ON i.municipality_code = m.code
    WHERE m.name = 'PORTO'

    UNION ALL

    SELECT
    m.code, m.name,
    c.shortname,
    c.votes,
    'coalition' AS list_type
    FROM municipality m
    JOIN coalition c ON c.municipality_code = m.code
    WHERE m.name = 'PORTO'
),

porto_mandates AS (
    SELECT mandates AS n
    FROM municipality
    WHERE name = 'PORTO'
),

divisors AS (
    SELECT 1 AS k

    UNION ALL

    SELECT k+1
    FROM divisors
    WHERE k < (SELECT n FROM porto_mandates)
),

quotients AS (
    SELECT
        lp.shortname,
        lp.list_type,
        d.k AS divisor,
        (lp.votes * 1.0)/ d.k AS quotient
    FROM lists_porto lp
    CROSS JOIN divisors d
),

top_quotients AS (
    SELECT shortname, list_type, divisor, quotient
    FROM quotients
    ORDER BY quotient DESC, shortname ASC, divisor ASC
    LIMIT (SELECT n FROM porto_mandates)
)

SELECT
    shortname, list_type,
    COUNT(*) AS mandates_elected
FROM top_quotients
GROUP BY shortname, list_type
ORDER BY mandates_elected DESC, shortname ASC;
