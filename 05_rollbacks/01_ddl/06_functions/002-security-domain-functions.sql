SET search_path TO hotel;

DROP FUNCTION IF EXISTS fn_security_user_has_permission(VARCHAR, VARCHAR, VARCHAR);
DROP FUNCTION IF EXISTS fn_security_set_updated_at();
