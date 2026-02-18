terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "archive_bucket" {
  source         = "../../modules/s3_log_archive"
  bucket_name    = var.bucket_name
  lifecycle_days = var.lifecycle_days
  tags           = var.tags
}

module "log_delivery_iam" {
  source        = "../../modules/iam_log_delivery"
  name_prefix   = var.name_prefix
  s3_bucket_arn = module.archive_bucket.bucket_arn
  tags          = var.tags
}
