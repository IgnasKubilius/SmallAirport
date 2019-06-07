CREATE FUNCTION vietuMax() RETURNS "trigger" AS $$
DECLARE maxsk   SMALLINT;
DECLARE temp   SMALLINT;
    BEGIN

         SELECT COUNT(*) INTO temp FROM Keleivis
         WHERE SkrydisID =  NEW.SkrydisID;

			SELECT VietuSkaicius INTO maxsk FROM Lektuvas
			WHERE ID = NEW.SkrydisID;

        
        IF temp >= maxsk
            THEN RAISE EXCEPTION 'Lektuve laisvu vietu nebera!';
        END IF;
        RETURN NEW;
    END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER pilnumui
    BEFORE INSERT OR UPDATE ON Keleivis
    FOR EACH ROW EXECUTE PROCEDURE vietuMax();
