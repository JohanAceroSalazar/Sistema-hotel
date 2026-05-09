SET search_path TO hotel;

INSERT INTO permission (name, description, action)
VALUES ('VIEW_SECURITY_DASHBOARD', 'View user, role and permission summaries', 'READ')
ON CONFLICT (name, action)
DO UPDATE SET
  description = EXCLUDED.description,
  status = 'ACTIVE',
  deleted_by = NULL,
  deleted_at = NULL,
  updated_at = CURRENT_TIMESTAMP;

INSERT INTO app_role (name, description)
VALUES ('AUDITOR', 'Read-only access to security information')
ON CONFLICT (name)
DO UPDATE SET
  description = EXCLUDED.description,
  status = 'ACTIVE',
  deleted_by = NULL,
  deleted_at = NULL,
  updated_at = CURRENT_TIMESTAMP;
