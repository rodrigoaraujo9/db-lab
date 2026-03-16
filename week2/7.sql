create or replace function check_party_votes_nonnegative(p_code text, p_party_id bigint)
returns boolean as $$
declare
    p_votes bigint;
begin
    select votes
    into p_votes
    from party_votes
    where municipality_code = p_code
      and party_id = p_party_id;

    if not found then
        raise exception 'No match in party_votes';
    end if;

    return p_votes >= 0;
end;
$$ language plpgsql;

-- SELECT check_party_votes_nonnegative('100100', 3);
-- SELECT check_party_votes_nonnegative('131200', 1);
