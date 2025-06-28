terraform {
  # Specify provider
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }

  required_version = ">= 1.2.0"
}

# Specify region
provider "aws" {
  region = var.aws_region
}
