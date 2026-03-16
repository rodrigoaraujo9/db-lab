create or replace function municipality_parties(p_code text)
returns table(
    party_shortname text,
    votes bigint
)
as $$
begin
    return query
    select
        p.shortname,
        pv.votes
    from party_votes pv
    join party p on pv.party_id = p.id
    join municipality m on pv.municipality_code = m.code
    where m.code = p_code
    order by pv.votes desc;
end;
$$ language plpgsql;

-- SELECT * FROM municipality_parties('131200');
