variable "bucket_name" {
  description = "Name of the S3 bucket for log archive"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

variable "lifecycle_days" {
  description = "Days before transitioning to cheaper storage"
  type        = number
  default     = 30
}
