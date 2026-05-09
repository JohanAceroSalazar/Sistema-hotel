SET search_path TO hotel;

CREATE INDEX IF NOT EXISTS ix_person_status ON person (status);
CREATE INDEX IF NOT EXISTS ix_app_user_status ON app_user (status);
CREATE INDEX IF NOT EXISTS ix_app_user_last_access ON app_user (last_access_at);
CREATE INDEX IF NOT EXISTS ix_app_view_module ON app_view (module_id);
CREATE INDEX IF NOT EXISTS ix_user_role_user ON user_role (user_id);
CREATE INDEX IF NOT EXISTS ix_user_role_role ON user_role (role_id);
CREATE INDEX IF NOT EXISTS ix_role_permission_role ON role_permission (role_id);
CREATE INDEX IF NOT EXISTS ix_role_permission_permission ON role_permission (permission_id);
CREATE INDEX IF NOT EXISTS ix_module_view_module ON module_view (module_id);
CREATE INDEX IF NOT EXISTS ix_module_view_view ON module_view (view_id);
