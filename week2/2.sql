CREATE OR REPLACE FUNCTION municipality_label(p_code text)
RETURNS text AS
$$
DECLARE
    v_name text;
    v_code text;
    v_result text;
BEGIN
    SELECT name, code
    INTO v_name, v_code
    FROM municipality
    WHERE code = p_code;

    IF v_name IS NULL THEN
        RETURN NULL;
    END IF;

    v_result := v_name || ' (' || v_code || ')';

    RETURN v_result;
END;
$$ LANGUAGE plpgsql;

-- SELECT municipality_label('131200'); -- Porto
