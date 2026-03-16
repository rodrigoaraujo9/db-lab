CREATE OR REPLACE FUNCTION municipality_size_class(p_code text)
RETURNS text AS $$
DECLARE
    mandates bigint;
BEGIN
    SELECT municipality.mandates
    INTO mandates
    FROM municipality
    WHERE code = p_code;

    IF mandates IS NULL THEN
        RETURN NULL;
    ELSIF mandates < 5 THEN
        RETURN 'small';
    ELSIF mandates < 10 THEN
        RETURN 'medium';
    ELSE
        RETURN 'large';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- SELECT municipality_size_class('131200');
