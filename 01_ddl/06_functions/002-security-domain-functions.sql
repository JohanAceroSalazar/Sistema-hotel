SET search_path TO hotel;

CREATE OR REPLACE FUNCTION fn_security_set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;

CREATE OR REPLACE FUNCTION fn_security_user_has_permission(
  p_username VARCHAR,
  p_permission_name VARCHAR,
  p_action VARCHAR
)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
  v_has_permission BOOLEAN;
BEGIN
  SELECT EXISTS (
    SELECT 1
    FROM app_user au
    JOIN user_role ur ON ur.user_id = au.id
    JOIN app_role ar ON ar.id = ur.role_id
    JOIN role_permission rp ON rp.role_id = ar.id
    JOIN permission pe ON pe.id = rp.permission_id
    WHERE au.username = p_username
      AND pe.name = p_permission_name
      AND pe.action = p_action
      AND au.status = 'ACTIVE'
      AND ur.status = 'ACTIVE'
      AND ar.status = 'ACTIVE'
      AND rp.status = 'ACTIVE'
      AND pe.status = 'ACTIVE'
  )
  INTO v_has_permission;

  RETURN v_has_permission;
END;
$$;
