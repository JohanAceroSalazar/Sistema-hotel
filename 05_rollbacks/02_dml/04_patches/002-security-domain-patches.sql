SET search_path TO hotel;

UPDATE module
SET base_path = '/security',
    description = 'Users, roles, permissions, modules and views'
WHERE name = 'SECURITY';

UPDATE app_view
SET path = '/security/users'
WHERE name = 'USER_ADMINISTRATION';
