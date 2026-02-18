# Observability Portfolio (Sanitized)

This repo is a **sanitized, shareable** portfolio demonstrating end-to-end observability patterns across:
- **Splunk** (dashboards + search patterns)
- **Cribl Stream** (routes + pipelines)
- **AWS** diagrams (Mermaid)
- **Terraform** (modules + examples)
- **Case studies** (2 end-to-end writeups)

> **Sanitization note:** All names, hostnames, account IDs, indices, and data patterns are fictional or generalized.  
> Replace placeholders like `<ORG>`, `<INDEX>`, `<AWS_ACCOUNT_ID>`, `<S3_BUCKET>`, and `<VPC_ID>` with your values.

## Repo structure

- `splunk/`
  - `dashboards/` – Splunk SimpleXML dashboards
  - `saved-searches/` – example searches/alerts in `.conf` format
- `cribl/`
  - `routes/` – example routes
  - `pipelines/` – pipelines used by routes (JSON)
  - `packs/` – pack skeletons + README
- `aws/diagrams/` – Mermaid architecture diagrams
- `terraform/`
  - `modules/` – reusable Terraform modules (sanitized)
  - `examples/` – runnable examples that compose modules
- `case-studies/` – two complete case studies with diagrams, SPL, and Terraform references

## Quick start

### Splunk dashboards
Import a dashboard XML from `splunk/dashboards/` into Splunk:
1. **Splunk Web → Dashboards → Create New Dashboard**
2. **Source → Paste XML**
3. Update:
   - `index=<INDEX>`
   - `sourcetype=<SOURCETYPE>`
   - `env=*` as needed

### Cribl
Use the JSON in `cribl/routes/` and `cribl/pipelines/` as templates:
- Create a new Route in Cribl Stream and paste the route JSON (or translate fields)
- Create pipelines from JSON and attach them to the route

### Terraform
Each example has a `README.md` with apply steps and placeholders.

## Safety & compliance
- No customer data, secrets, or proprietary identifiers.
- Placeholder ARNs and IDs.
- Sample payloads are synthetic.

## License
MIT (see `LICENSE`)

_Last updated: 2026-01-22_
