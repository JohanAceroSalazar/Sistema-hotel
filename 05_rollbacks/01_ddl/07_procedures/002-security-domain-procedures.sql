SET search_path TO hotel;

DROP PROCEDURE IF EXISTS sp_security_refresh_user_permission_summary();
DROP PROCEDURE IF EXISTS sp_security_assign_role(VARCHAR, VARCHAR, BIGINT);
