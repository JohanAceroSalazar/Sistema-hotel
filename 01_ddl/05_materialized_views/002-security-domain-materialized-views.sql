SET search_path TO hotel;

CREATE MATERIALIZED VIEW IF NOT EXISTS mv_security_user_permission_summary AS
SELECT
  au.id AS user_id,
  au.username,
  COUNT(DISTINCT ar.id) AS role_count,
  COUNT(DISTINCT pe.id) AS permission_count,
  MAX(au.last_access_at) AS last_access_at
FROM app_user au
LEFT JOIN user_role ur ON ur.user_id = au.id AND ur.status = 'ACTIVE'
LEFT JOIN app_role ar ON ar.id = ur.role_id AND ar.status = 'ACTIVE'
LEFT JOIN role_permission rp ON rp.role_id = ar.id AND rp.status = 'ACTIVE'
LEFT JOIN permission pe ON pe.id = rp.permission_id AND pe.status = 'ACTIVE'
WHERE au.status = 'ACTIVE'
GROUP BY au.id, au.username;

CREATE UNIQUE INDEX IF NOT EXISTS ux_mv_security_user_permission_summary_user
ON mv_security_user_permission_summary (user_id);
