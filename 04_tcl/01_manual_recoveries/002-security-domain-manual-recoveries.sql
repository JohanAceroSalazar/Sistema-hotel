BEGIN;

SET LOCAL search_path TO hotel;

UPDATE app_role
SET status = 'ACTIVE',
    deleted_at = NULL,
    deleted_by = NULL
WHERE name IN ('ADMINISTRATOR', 'AUDITOR')
  AND deleted_at IS NOT NULL;

UPDATE permission
SET status = 'ACTIVE',
    deleted_at = NULL,
    deleted_by = NULL
WHERE name IN ('MANAGE_USERS', 'MANAGE_ROLES', 'MANAGE_PERMISSIONS', 'VIEW_SECURITY_DASHBOARD')
  AND deleted_at IS NOT NULL;

COMMIT;
