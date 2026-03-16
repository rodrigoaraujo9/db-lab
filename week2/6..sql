create or replace function sum_votes_of_municipality(p_code text)
returns bigint as $$
declare
    r record;
    total bigint := 0;
begin
    for r in
        select votes
        from party_votes
        where municipality_code = p_code
    loop
        total := total + coalesce(r.votes,0);
    end loop;
    return total;
end;
$$ language plpgsql;

SELECT sum_votes_of_municipality('131200');
