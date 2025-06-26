terraform {
  # declare provider and version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }
}

# Specify region
provider "aws" {
  region  = "us-east-1"
}