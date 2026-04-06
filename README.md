# AWS Cloud Native Ecommerce Platform

This repository now includes:

- Terraform infrastructure for a cloud-native ecommerce deployment on AWS:
  - VPC (public/private app/private DB subnets, IGW, NAT)
  - S3 buckets for `client` and `admin` frontends
  - CloudFront distributions in front of each S3 frontend bucket
  - ALB with path-based routing (`/admin*` to admin backend, default to API backend)
  - EC2 launch templates + Auto Scaling Groups for API and admin backend workloads
  - RDS PostgreSQL in private DB subnets
- GitHub Actions CI/CD pipeline:
  - Terraform lint/validate/plan/apply
  - Frontend deploys to S3 + CloudFront invalidation
  - Backend rollout via ASG instance refresh

## Folder Structure

```text
infra/terraform/
  ├── providers.tf
  ├── variables.tf
  ├── main.tf
  ├── iam.tf
  ├── outputs.tf
  ├── terraform.tfvars.example
  ├── userdata-api.sh.tftpl
  └── userdata-admin.sh.tftpl

.github/workflows/
  └── cicd.yml
```

## Deploy Infrastructure with Terraform

```bash
cd infra/terraform
cp terraform.tfvars.example terraform.tfvars
# update terraform.tfvars with real values
terraform init
terraform plan
terraform apply
```

## Required GitHub Secrets for Pipeline

- `AWS_ROLE_TO_ASSUME` (OIDC role ARN)
- `S3_BUCKET_CLIENT`
- `S3_BUCKET_ADMIN`
- `CF_DISTRIBUTION_CLIENT_ID`
- `CF_DISTRIBUTION_ADMIN_ID`
- `API_ASG_NAME`
- `ADMIN_ASG_NAME`

## Notes

- Replace the user-data placeholders with your real backend bootstrap/deployment logic.
- Add ACM + HTTPS listener configuration for production-grade TLS on the ALB.
