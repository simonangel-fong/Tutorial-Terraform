# ################################
# providers
# ################################
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ca-central-1"
}

# ################################
# S3
# ################################

variable "s3_bucket_name" {
  description = "AWS S3 bucket"
  type        = string
  default     = "aws-api.arguswatcher.net"
}

variable "data_dir" {
  description = "The dir to be uploaded"
  type        = string
  default     = "data"
}
