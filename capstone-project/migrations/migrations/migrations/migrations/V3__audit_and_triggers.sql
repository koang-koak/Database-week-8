-- V3__audit_and_triggers.sql: Automated audit logging function & trigger
CREATE OR REPLACE FUNCTION log_event_changes()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_logs (table_name, action, row_data)
    VALUES (
        TG_TABLE_NAME, 
        TG_OP, 
        row_to_json(COALESCE(NEW, OLD))::jsonb
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER audit_events_changes
AFTER INSERT OR UPDATE OR DELETE ON events
FOR EACH ROW EXECUTE FUNCTION log_event_changes();