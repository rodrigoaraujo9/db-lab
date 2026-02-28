SELECT
    c.municipality_code,
    c.shortname AS coalition_shortname,
    c.name AS coalition_name,
    STRING_AGG(p.shortname, '.'  ORDER BY cm.order_number) AS members_shortnames,
    (STRING_AGG(p.shortname, '.' ORDER BY cm.order_number) = c.shortname) AS matches_shortname
FROM coalition c
JOIN coalition_member cm
    ON cm.municipality_code = c.municipality_code
    AND cm.coalition_shortname = c.shortname
JOIN party p
    ON p.id = cm.party_id
GROUP BY
    c.municipality_code,
    c.shortname,
    c.name
ORDER BY
    c.municipality_code,
    c.shortname;
