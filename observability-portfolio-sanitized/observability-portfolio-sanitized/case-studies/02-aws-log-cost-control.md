# Case Study 02: Controlling AWS Log Costs with Routing + Tiered Storage (Sanitized)

## Goal
Reduce logging cost while preserving forensic value by:
- routing high-volume logs to **S3 archive**
- keeping only **high-value fields** in Splunk
- applying retention and lifecycle policies via Terraform

## Context (sanitized)
- Sources: ALB access logs, CloudWatch application logs
- Pipeline: Cribl for parsing + field reduction + routing
- Storage: Splunk for indexed search + S3 for long-term archive

## Architecture
Mermaid diagram:
- `aws/diagrams/observability_ingest.mmd`

## Approach
### 1) Route by source type (Cribl)
- CloudWatch → normalize → Splunk HEC
- K8s logs → enrich + redact → Splunk HEC
- ALB logs → parse + keep minimal fields → S3 archive

See:
- `cribl/routes/route_sanitized_observability.json`
- `cribl/pipelines/pipe_alb_parse.json`

### 2) Field minimization for expensive sources
For ALB logs:
- keep: status codes, latency, URL, client IP (or hash/partial), bytes
- drop: bulky UA strings (optional), low-value headers, duplicates

### 3) Automate archive storage with Terraform
Create:
- S3 bucket with encryption, public access blocks, lifecycle transitions
- IAM role/policy for log delivery

See:
- `terraform/modules/s3_log_archive`
- `terraform/modules/iam_log_delivery`
- `terraform/examples/log_archive_stack`

## SPL example for archived-to-indexed parity checks
```spl
index=<INDEX> source=alb
| timechart span=5m count as splunk_events, avg(latency_ms) as avg_latency_ms
```

## Results (sanitized, directional)
- Lower indexed volume by routing/keeping minimal fields
- Retained full-fidelity logs in S3 for long-term needs
- Reduced query cost via normalized fields and shorter events

## What I’d do next
- Add S3 inventory + Athena tables for low-cost retrospective queries
- Add hashing for client IP to preserve uniqueness without raw values
- Add anomaly detection for latency/5xx based on seasonality

_Last updated: 2026-01-22_
