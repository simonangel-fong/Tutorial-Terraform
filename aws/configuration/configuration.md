# Terraform - AWS Configuration

[Back](../../README.md)

- [Terraform - AWS Configuration](#terraform---aws-configuration)
  - [AWS Configuration](#aws-configuration)
  - [Set AWS Terraform providers](#set-aws-terraform-providers)
  - [First Project](#first-project)

---

## AWS Configuration

- Create a Terraform user in AWS.
- Add Policy
- Create Access Key

---

- Configure AWS credentials in the AWS CLI

```sh
aws --version
# aws-cli/2.19.1 Python/3.12.6 Windows/11 exe/AMD64

aws configure
```

---

## Set AWS Terraform providers

- Check the latest version: https://registry.terraform.io/providers/hashicorp/aws/latest

- `provider.tf`

```hcl
terraform {
  # declare provider and version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }
}
```

- Initialize our Terraform project

```sh
terraform init
# Initializing the backend...
# Initializing provider plugins...
# - Finding hashicorp/aws versions matching "~> 6.0.0"...
# - Installing hashicorp/aws v6.0.0...
# - Installed hashicorp/aws v6.0.0 (signed by HashiCorp)
# Terraform has created a lock file .terraform.lock.hcl to record the provider
# selections it made above. Include this file in your version control repository
# so that Terraform can guarantee to make the same selections by default when
# you run "terraform init" in the future.

# Terraform has been successfully initialized!

# You may now begin working with Terraform. Try running "terraform plan" to see
# any changes that are required for your infrastructure. All Terraform commands
# should now work.

# If you ever set or change modules or backend configuration for Terraform,
# rerun this command to reinitialize your working directory. If you forget, other
# commands will detect it and remind you to do so if necessary.
```

---

## First Project

- Create `main.tf` to manage resources

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "my_vm" {
 ami                       = "ami-065deacbcaac64cf2" //Ubuntu AMI
 instance_type             = "t2.micro"

 tags = {
   Name = "My EC2 instance",
 }
}
```
