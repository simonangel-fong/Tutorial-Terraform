# ##########################################################
# Provider
# ##########################################################
variable "aws_region" {
  type    = string
  default = "ca-central-1"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "nginx-app"
}

# ##########################################################
# VPC
# ##########################################################
variable "vpc_cidr" {
  description = "CIDR block for main"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_a" {
  type    = string
  default = "ca-central-1a"
}

variable "az_b" {
  type    = string
  default = "ca-central-1b"
}


# variable "ami_id" {
#   description = "AMI id"
#   type        = string
#   default     = "ami-0bb887e1f2559badd"
# }

# variable "ec2_instance_type" {
#   description = "EC2 instance type"
#   type        = string
#   default     = "t3.micro"
# }

# variable "key_pair" {
#   description = "Key pair name"
#   type        = string
#   default     = ""    # key pair name
# }

# variable "ecs_iam_role" {
#   description = "ECS container instance IAM role"
#   type        = string
#   default     = "ecsInstanceRole"
# }
