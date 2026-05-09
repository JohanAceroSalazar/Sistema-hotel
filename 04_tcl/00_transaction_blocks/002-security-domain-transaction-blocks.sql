BEGIN;

SET LOCAL search_path TO hotel;

CALL sp_security_refresh_user_permission_summary();

COMMIT;
