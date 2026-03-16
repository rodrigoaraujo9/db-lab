create or replace function party_name_by_shortname(p_shortname text)
returns text as $$
declare
    p_name text;
begin
    select name
    into p_name
    from party
    where shortname = p_shortname;

    if not found then
        raise exception 'Party shortname did not match any in Db';
    else return p_name;
    end if;

end;
$$ language plpgsql;

-- SELECT party_name_by_shortname('PS');
