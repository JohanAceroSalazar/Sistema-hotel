BEGIN;

SET LOCAL search_path TO hotel;

REFRESH MATERIALIZED VIEW mv_security_user_permission_summary;

COMMIT;
