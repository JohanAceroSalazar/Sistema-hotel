SET search_path TO hotel;

UPDATE app_role
SET description = 'Full administrative access'
WHERE name = 'ADMINISTRATOR';

UPDATE permission
SET description = 'View security access summary'
WHERE name = 'VIEW_SECURITY_DASHBOARD'
  AND action = 'READ';
