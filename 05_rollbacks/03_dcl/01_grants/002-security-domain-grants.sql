REVOKE EXECUTE ON PROCEDURE hotel.sp_security_refresh_user_permission_summary() FROM hotel_security_write;
REVOKE EXECUTE ON PROCEDURE hotel.sp_security_assign_role(VARCHAR, VARCHAR, BIGINT) FROM hotel_security_write;
REVOKE EXECUTE ON FUNCTION hotel.fn_security_user_has_permission(VARCHAR, VARCHAR, VARCHAR) FROM hotel_security_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA hotel
REVOKE EXECUTE ON FUNCTIONS FROM hotel_security_write;

ALTER DEFAULT PRIVILEGES IN SCHEMA hotel
REVOKE USAGE, SELECT, UPDATE ON SEQUENCES FROM hotel_security_write;

ALTER DEFAULT PRIVILEGES IN SCHEMA hotel
REVOKE SELECT ON TABLES FROM hotel_security_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA hotel
REVOKE SELECT, INSERT, UPDATE, DELETE ON TABLES FROM hotel_security_write;

REVOKE USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA hotel FROM hotel_security_write;

REVOKE SELECT, INSERT, UPDATE, DELETE ON
  hotel.person,
  hotel.app_role,
  hotel.permission,
  hotel.module,
  hotel.app_view,
  hotel.app_user,
  hotel.user_role,
  hotel.role_permission,
  hotel.module_view
FROM hotel_security_write;

REVOKE SELECT ON
  hotel.person,
  hotel.app_role,
  hotel.permission,
  hotel.module,
  hotel.app_view,
  hotel.app_user,
  hotel.user_role,
  hotel.role_permission,
  hotel.module_view,
  hotel.vw_security_user_access,
  hotel.vw_security_role_permissions,
  hotel.vw_security_module_views,
  hotel.mv_security_user_permission_summary
FROM hotel_security_read;

REVOKE hotel_security_write FROM ariel5253;
REVOKE hotel_security_read FROM ariel5253;
REVOKE CONNECT, CREATE ON DATABASE sistema_hotel FROM ariel5253;

REVOKE USAGE, CREATE ON SCHEMA hotel FROM hotel_security_write;
REVOKE USAGE ON SCHEMA hotel FROM hotel_security_read;
