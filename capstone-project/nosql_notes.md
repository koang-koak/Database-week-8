# NoSQL Layer Justification

## 1. Redis (In-Memory Cache & Rate Limiter)
* **Why chosen:** Real-time analytics platforms experience extremely high write and read concurrency for counters (e.g., active user counts, page view hits per second).
* **Problem solved better than PostgreSQL:** Storing live counters directly in Postgres relational tables causes row-lock contention and high disk I/O under heavy load. Redis handles sub-millisecond atomic increments (`INCR`) in memory, keeping dashboard metrics blazing fast without burdening the primary database.

## 2. MongoDB (Telemetry Ingestion Buffer)
* **Why chosen:** Incoming event webhooks and IoT telemetry payloads have highly variable, evolving schemas that change frequently depending on client integrations.
* **Problem solved better than PostgreSQL:** Enforcing a rigid relational schema or constantly altering table columns for experimental event attributes creates migration bottlenecks. MongoDB's flexible document model allows raw JSON event streams to be ingested instantly without structural friction.