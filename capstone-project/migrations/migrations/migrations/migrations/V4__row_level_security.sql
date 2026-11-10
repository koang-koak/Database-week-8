-- V4__row_level_security.sql: Enforce multi-tenant data isolation via RLS
ALTER TABLE events ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- Policy for Events table
CREATE POLICY tenant_isolation_policy_events ON events
    FOR ALL
    USING (tenant_id = NULLIF(current_setting('app.current_tenant_id', true), '')::integer);

-- Policy for Users table
CREATE POLICY tenant_isolation_policy_users ON users
    FOR ALL
    USING (tenant_id = NULLIF(current_setting('app.current_tenant_id', true), '')::integer);