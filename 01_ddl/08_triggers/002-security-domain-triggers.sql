SET search_path TO hotel;

CREATE TRIGGER trg_person_set_updated_at
BEFORE UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();

CREATE TRIGGER trg_app_role_set_updated_at
BEFORE UPDATE ON app_role
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();

CREATE TRIGGER trg_permission_set_updated_at
BEFORE UPDATE ON permission
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();

CREATE TRIGGER trg_module_set_updated_at
BEFORE UPDATE ON module
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();

CREATE TRIGGER trg_app_view_set_updated_at
BEFORE UPDATE ON app_view
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();

CREATE TRIGGER trg_app_user_set_updated_at
BEFORE UPDATE ON app_user
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();

CREATE TRIGGER trg_user_role_set_updated_at
BEFORE UPDATE ON user_role
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();

CREATE TRIGGER trg_role_permission_set_updated_at
BEFORE UPDATE ON role_permission
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();

CREATE TRIGGER trg_module_view_set_updated_at
BEFORE UPDATE ON module_view
FOR EACH ROW
EXECUTE FUNCTION fn_security_set_updated_at();
