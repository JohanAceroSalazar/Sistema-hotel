GRANT USAGE ON SCHEMA hotel TO hotel_security_read;
GRANT USAGE, CREATE ON SCHEMA hotel TO hotel_security_write;

GRANT CONNECT, CREATE ON DATABASE sistema_hotel TO ariel5253;
GRANT hotel_security_read TO ariel5253;
GRANT hotel_security_write TO ariel5253;

GRANT SELECT ON
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
TO hotel_security_read;

GRANT SELECT, INSERT, UPDATE, DELETE ON
  hotel.person,
  hotel.app_role,
  hotel.permission,
  hotel.module,
  hotel.app_view,
  hotel.app_user,
  hotel.user_role,
  hotel.role_permission,
  hotel.module_view
TO hotel_security_write;

GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA hotel TO hotel_security_write;
GRANT EXECUTE ON FUNCTION hotel.fn_security_user_has_permission(VARCHAR, VARCHAR, VARCHAR) TO hotel_security_read;
GRANT EXECUTE ON PROCEDURE hotel.sp_security_assign_role(VARCHAR, VARCHAR, BIGINT) TO hotel_security_write;
GRANT EXECUTE ON PROCEDURE hotel.sp_security_refresh_user_permission_summary() TO hotel_security_write;

ALTER DEFAULT PRIVILEGES IN SCHEMA hotel
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO hotel_security_write;

ALTER DEFAULT PRIVILEGES IN SCHEMA hotel
GRANT SELECT ON TABLES TO hotel_security_read;

ALTER DEFAULT PRIVILEGES IN SCHEMA hotel
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO hotel_security_write;

ALTER DEFAULT PRIVILEGES IN SCHEMA hotel
GRANT EXECUTE ON FUNCTIONS TO hotel_security_write;
