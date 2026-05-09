SET search_path TO hotel;

DROP INDEX IF EXISTS ix_module_view_view;
DROP INDEX IF EXISTS ix_module_view_module;
DROP INDEX IF EXISTS ix_role_permission_permission;
DROP INDEX IF EXISTS ix_role_permission_role;
DROP INDEX IF EXISTS ix_user_role_role;
DROP INDEX IF EXISTS ix_user_role_user;
DROP INDEX IF EXISTS ix_app_view_module;
DROP INDEX IF EXISTS ix_app_user_last_access;
DROP INDEX IF EXISTS ix_app_user_status;
DROP INDEX IF EXISTS ix_person_status;
