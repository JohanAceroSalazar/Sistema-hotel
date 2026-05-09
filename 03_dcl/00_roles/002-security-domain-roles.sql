DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'hotel_security_read') THEN
    CREATE ROLE hotel_security_read NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'hotel_security_write') THEN
    CREATE ROLE hotel_security_write NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'ariel5253') THEN
    CREATE ROLE ariel5253 LOGIN PASSWORD 'ariel5253';
  ELSE
    ALTER ROLE ariel5253 LOGIN PASSWORD 'ariel5253';
  END IF;
END;
$$;
