# Case Study 01: Reducing Kubernetes Incident MTTR with Normalized Logs + Dashboards (Sanitized)

## Goal
Reduce mean time to resolution (MTTR) for intermittent service failures in a Kubernetes environment by:
- normalizing log fields across services
- redacting sensitive data
- building fast dashboards with actionable drilldowns

## Context (sanitized)
- Platform: Kubernetes (EKS-like)
- Ingest: Cribl Stream
- Analytics: Splunk
- Data: container logs + app logs + ingress logs

## Approach
### 1) Normalize and enrich at ingest (Cribl)
Key patterns implemented:
- Extract JSON payloads when present
- Standardize fields: `env`, `service`, `cluster`, `namespace`, `pod`, `container`
- Add `event_id` for cross-pipeline traceability
- Redact secrets (Bearer tokens, API keys)

See:
- `cribl/pipelines/pipe_k8s_enrich_redact.json`

### 2) Build dashboards focused on triage speed (Splunk)
Dashboard features:
- Availability + latency KPIs
- P95 latency trend
- Top erroring hosts/pods
- Drilldown search patterns

See:
- `splunk/dashboards/infra_health.xml`

### 3) Operationalize with alerts
Examples:
- P95 latency sustained threshold
- Error burst detection
See:
- `splunk/saved-searches/savedsearches.conf`

## Example SPL building blocks
```spl
index=<INDEX> sourcetype=<SOURCETYPE> env=prod
| stats count as events, dc(pod) as pods by service status
| sort - events
```

```spl
index=<INDEX> sourcetype=<SOURCETYPE> env=prod status=error
| timechart span=5m count by service
```

## Results (sanitized, directional)
- Faster triage due to consistent fields across services
- Reduced dashboard query complexity (fewer conditional extractions)
- Improved signal-to-noise via ingest-time drops of known probes

## What I’d do next
- Add trace correlation (`trace_id`) propagation and span-based dashboards
- Add SLO burn-rate alerts
- Extend redaction rules with org-approved patterns

_Last updated: 2026-01-22_
