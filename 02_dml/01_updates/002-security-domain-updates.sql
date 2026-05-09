SET search_path TO hotel;

UPDATE app_role
SET description = 'Full administrative access to security configuration'
WHERE name = 'ADMINISTRATOR';

UPDATE permission
SET description = 'View user, role and permission summaries'
WHERE name = 'VIEW_SECURITY_DASHBOARD'
  AND action = 'READ';
