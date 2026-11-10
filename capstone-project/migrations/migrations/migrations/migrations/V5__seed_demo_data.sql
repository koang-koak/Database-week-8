-- V5__seed_demo_data.sql: Insert test records
INSERT INTO tenants (tenant_name) VALUES ('Acme Corp'), ('Globex Corporation');

INSERT INTO users (tenant_id, email, role) VALUES 
(1, 'admin@acme.com', 'admin'),
(2, 'admin@globex.com', 'admin');

INSERT INTO events (tenant_id, event_type, payload) VALUES 
(1, 'page_view', '{"page": "/dashboard", "browser": "Chrome"}'),
(1, 'click', '{"element_id": "signup_btn"}'),
(2, 'page_view', '{"page": "/pricing", "browser": "Safari"}');