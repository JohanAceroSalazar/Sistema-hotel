SET search_path TO hotel;

CREATE OR REPLACE VIEW vw_security_user_access AS
SELECT
  au.id AS user_id,
  au.username,
  p.document_type,
  p.document_number,
  p.first_name,
  p.last_name,
  p.email,
  ar.name AS role_name,
  pe.name AS permission_name,
  pe.action AS permission_action,
  au.status AS user_status
FROM app_user au
JOIN person p ON p.id = au.person_id
LEFT JOIN user_role ur ON ur.user_id = au.id AND ur.status = 'ACTIVE'
LEFT JOIN app_role ar ON ar.id = ur.role_id AND ar.status = 'ACTIVE'
LEFT JOIN role_permission rp ON rp.role_id = ar.id AND rp.status = 'ACTIVE'
LEFT JOIN permission pe ON pe.id = rp.permission_id AND pe.status = 'ACTIVE'
WHERE au.status = 'ACTIVE'
  AND p.status = 'ACTIVE';

CREATE OR REPLACE VIEW vw_security_role_permissions AS
SELECT
  ar.id AS role_id,
  ar.name AS role_name,
  ar.description AS role_description,
  pe.id AS permission_id,
  pe.name AS permission_name,
  pe.action AS permission_action,
  pe.description AS permission_description
FROM app_role ar
JOIN role_permission rp ON rp.role_id = ar.id
JOIN permission pe ON pe.id = rp.permission_id
WHERE ar.status = 'ACTIVE'
  AND rp.status = 'ACTIVE'
  AND pe.status = 'ACTIVE';

CREATE OR REPLACE VIEW vw_security_module_views AS
SELECT
  mo.id AS module_id,
  mo.name AS module_name,
  mo.base_path AS module_base_path,
  av.id AS view_id,
  av.name AS view_name,
  av.path AS view_path
FROM module mo
JOIN module_view mv ON mv.module_id = mo.id
JOIN app_view av ON av.id = mv.view_id
WHERE mo.status = 'ACTIVE'
  AND mv.status = 'ACTIVE'
  AND av.status = 'ACTIVE';
