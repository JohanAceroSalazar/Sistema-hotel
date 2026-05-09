SET search_path TO hotel;

DROP TRIGGER IF EXISTS trg_module_view_set_updated_at ON module_view;
DROP TRIGGER IF EXISTS trg_role_permission_set_updated_at ON role_permission;
DROP TRIGGER IF EXISTS trg_user_role_set_updated_at ON user_role;
DROP TRIGGER IF EXISTS trg_app_user_set_updated_at ON app_user;
DROP TRIGGER IF EXISTS trg_app_view_set_updated_at ON app_view;
DROP TRIGGER IF EXISTS trg_module_set_updated_at ON module;
DROP TRIGGER IF EXISTS trg_permission_set_updated_at ON permission;
DROP TRIGGER IF EXISTS trg_app_role_set_updated_at ON app_role;
DROP TRIGGER IF EXISTS trg_person_set_updated_at ON person;
