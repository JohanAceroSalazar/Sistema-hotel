SET search_path TO hotel;

UPDATE app_role
SET status = 'INACTIVE',
    deleted_at = CURRENT_TIMESTAMP
WHERE name = 'DEPRECATED_SECURITY_ROLE'
  AND status = 'ACTIVE';
