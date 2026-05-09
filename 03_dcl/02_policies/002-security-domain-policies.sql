ALTER TABLE hotel.person ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotel.app_role ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotel.permission ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotel.module ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotel.app_view ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotel.app_user ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotel.user_role ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotel.role_permission ENABLE ROW LEVEL SECURITY;
ALTER TABLE hotel.module_view ENABLE ROW LEVEL SECURITY;

CREATE POLICY pol_person_security_read ON hotel.person
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_app_role_security_read ON hotel.app_role
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_permission_security_read ON hotel.permission
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_module_security_read ON hotel.module
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_app_view_security_read ON hotel.app_view
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_app_user_security_read ON hotel.app_user
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_user_role_security_read ON hotel.user_role
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_role_permission_security_read ON hotel.role_permission
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_module_view_security_read ON hotel.module_view
FOR SELECT TO hotel_security_read
USING (status = 'ACTIVE');

CREATE POLICY pol_person_security_write ON hotel.person
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);

CREATE POLICY pol_app_role_security_write ON hotel.app_role
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);

CREATE POLICY pol_permission_security_write ON hotel.permission
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);

CREATE POLICY pol_module_security_write ON hotel.module
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);

CREATE POLICY pol_app_view_security_write ON hotel.app_view
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);

CREATE POLICY pol_app_user_security_write ON hotel.app_user
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);

CREATE POLICY pol_user_role_security_write ON hotel.user_role
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);

CREATE POLICY pol_role_permission_security_write ON hotel.role_permission
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);

CREATE POLICY pol_module_view_security_write ON hotel.module_view
FOR ALL TO hotel_security_write
USING (true)
WITH CHECK (true);
