SET search_path TO hotel;

INSERT INTO module (name, description, base_path)
VALUES ('SECURITY', 'Users, roles, permissions, modules and views', '/security')
ON CONFLICT (name)
DO NOTHING;

INSERT INTO app_role (name, description)
VALUES
  ('ADMINISTRATOR', 'Full administrative access'),
  ('RECEPTIONIST', 'Access to reception workflows'),
  ('MAINTENANCE', 'Access to maintenance workflows'),
  ('INVENTORY', 'Access to inventory workflows')
ON CONFLICT (name)
DO NOTHING;

INSERT INTO permission (name, description, action)
VALUES
  ('MANAGE_USERS', 'Create, update and query system users', 'WRITE'),
  ('MANAGE_ROLES', 'Create, update and query roles', 'WRITE'),
  ('MANAGE_PERMISSIONS', 'Create, update and query permissions', 'WRITE'),
  ('VIEW_SECURITY_DASHBOARD', 'View security access summary', 'READ')
ON CONFLICT (name, action)
DO NOTHING;

INSERT INTO app_view (module_id, name, description, path)
SELECT m.id, v.name, v.description, v.path
FROM module m
CROSS JOIN (
  VALUES
    ('USER_ADMINISTRATION', 'User administration view', '/security/users'),
    ('ROLE_ADMINISTRATION', 'Role administration view', '/security/roles'),
    ('PERMISSION_ADMINISTRATION', 'Permission administration view', '/security/permissions')
) AS v(name, description, path)
WHERE m.name = 'SECURITY'
ON CONFLICT (module_id, path)
DO NOTHING;

INSERT INTO role_permission (role_id, permission_id)
SELECT ar.id, pe.id
FROM app_role ar
CROSS JOIN permission pe
WHERE ar.name = 'ADMINISTRATOR'
  AND pe.name IN ('MANAGE_USERS', 'MANAGE_ROLES', 'MANAGE_PERMISSIONS', 'VIEW_SECURITY_DASHBOARD')
ON CONFLICT (role_id, permission_id)
DO NOTHING;

INSERT INTO module_view (module_id, view_id)
SELECT m.id, av.id
FROM module m
JOIN app_view av ON av.module_id = m.id
WHERE m.name = 'SECURITY'
ON CONFLICT (module_id, view_id)
DO NOTHING;
