variable "name_prefix" {
  type        = string
  description = "Prefix for IAM resources"
}

variable "s3_bucket_arn" {
  type        = string
  description = "ARN of the archive S3 bucket"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
