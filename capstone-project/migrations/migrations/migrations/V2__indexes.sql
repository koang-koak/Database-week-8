-- V2__indexes.sql: Performance indexes for filtering and sorting
CREATE INDEX idx_events_tenant_time ON events (tenant_id, occurred_at DESC);
CREATE INDEX idx_users_tenant ON users (tenant_id);
CREATE INDEX idx_events_payload_gin ON events USING GIN (payload);