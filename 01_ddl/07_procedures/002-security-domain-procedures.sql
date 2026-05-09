SET search_path TO hotel;

CREATE OR REPLACE PROCEDURE sp_security_assign_role(
  p_username VARCHAR,
  p_role_name VARCHAR,
  p_created_by BIGINT DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
  v_user_id BIGINT;
  v_role_id BIGINT;
BEGIN
  SELECT id INTO v_user_id
  FROM app_user
  WHERE username = p_username
    AND status = 'ACTIVE';

  IF v_user_id IS NULL THEN
    RAISE EXCEPTION 'User % does not exist or is not active', p_username;
  END IF;

  SELECT id INTO v_role_id
  FROM app_role
  WHERE name = p_role_name
    AND status = 'ACTIVE';

  IF v_role_id IS NULL THEN
    RAISE EXCEPTION 'Role % does not exist or is not active', p_role_name;
  END IF;

  INSERT INTO user_role (user_id, role_id, created_by)
  VALUES (v_user_id, v_role_id, p_created_by)
  ON CONFLICT (user_id, role_id)
  DO UPDATE SET
    status = 'ACTIVE',
    deleted_by = NULL,
    deleted_at = NULL,
    updated_by = p_created_by,
    updated_at = CURRENT_TIMESTAMP;
END;
$$;

CREATE OR REPLACE PROCEDURE sp_security_refresh_user_permission_summary()
LANGUAGE plpgsql
AS $$
BEGIN
  REFRESH MATERIALIZED VIEW mv_security_user_permission_summary;
END;
$$;
