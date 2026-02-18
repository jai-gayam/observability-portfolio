variable "region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket for log archive"
  default     = "<S3_BUCKET>"
}

variable "name_prefix" {
  type        = string
  default     = "obs"
}

variable "lifecycle_days" {
  type    = number
  default = 30
}

variable "tags" {
  type = map(string)
  default = {
    project = "observability"
    owner   = "<ORG>"
  }
}
