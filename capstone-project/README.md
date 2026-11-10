# Capstone Build Sprint: Real-Time Analytics Platform

## 1. Requirements Summary
* **Project Track:** Real-Time Analytics Platform (Track C)
* **Objective:** Build a scalable, secure, and performant backend data platform that ingests high-volume real-time event streams, stores structured tenant metadata in PostgreSQL, caches low-latency metric counters in Redis, and archives raw event payloads in MongoDB.
* **Core Entities:** `tenants`, `users`, `events`, `metrics`, and `audit_logs`.
* **Key Features:** Row-Level Security (RLS) for multi-tenancy, automated audit logging via database triggers, versioned schema migrations via Flyway, and query optimization.

---

## 2. Architecture & NoSQL Integration
* **PostgreSQL:** Handles relational core entities, foreign key constraints, ACID compliance, and strict multi-tenant isolation via RLS.
* **Redis:** Acts as a high-speed in-memory cache for real-time dashboard counters and rate-limiting session tokens.
* **MongoDB:** Serves as a flexible document store for semi-structured, high-velocity incoming event telemetry payloads.

---

## 3. Query Optimization Evidence
* **Query:** Retrieve total event counts per tenant for a specific time range.
* **Before Optimization:** Sequential scan (`Seq Scan`) across 1,000,000 rows taking ~1.4 seconds.
* **Change:** Added a composite B-tree index on `(tenant_id, timestamp)`.
* **After Optimization:** Index Scan (`Bitmap Index Scan`) executing in ~12ms.

---

## 4. Backup & Disaster Recovery
* **Backup Command:** `pg_dump -Fc -f backups/capstone_$(date +%F).dump capstone`
* **Restoration Verification:** Tested successfully via `pg_restore`.