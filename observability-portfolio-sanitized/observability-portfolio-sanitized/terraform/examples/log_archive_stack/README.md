# Example: Log Archive Stack (Sanitized)

Creates:
- S3 bucket with encryption + lifecycle
- IAM role/policy for log delivery to S3

## Run
```bash
cd terraform/examples/log_archive_stack
terraform init
terraform plan -out tfplan
terraform apply tfplan
```

## Replace placeholders
- `<S3_BUCKET>`
- `<ORG>`

> This example is intentionally minimal; adapt policy principals and conditions to your org's standards.
