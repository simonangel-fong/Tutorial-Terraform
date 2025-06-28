variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ca-central-1"
}

variable "domain_name" {
  description = "Domain name for the bucket"
  type        = string
  default     = "name.record_name"
}

data "cloudflare_zone" "record_name" {
  name = "record_name"
}

