SET search_path TO hotel;

UPDATE app_role
SET status = 'ACTIVE',
    deleted_at = NULL,
    deleted_by = NULL
WHERE name = 'DEPRECATED_SECURITY_ROLE';
