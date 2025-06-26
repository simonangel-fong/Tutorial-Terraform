# Terraform - AWS EC2: Using Variable

[Back](../../README.md)

- [Terraform - AWS EC2: Using Variable](#terraform---aws-ec2-using-variable)
  - [Using Variable](#using-variable)
  - [Local variables](#local-variables)
  - [Input variables](#input-variables)
    - [Using Default Value](#using-default-value)
  - [??terraform.tfvars??](#terraformtfvars)
  - [Output Variables](#output-variables)

---

## Using Variable

- three types of variables in Terraform:
  - local,
  - input,
  - and output

---

## Local variables

- `variables.tf`

```hcl
locals {
 ami      = "ami-0a7d80731ae1b2435"
 type     = "t2.micro"
 name_tag = "My EC2 Instance"
}
```

- Refer variable in `main.tf`

```hcl
resource "aws_instance" "my_vm" {
 ami           = local.ami
 instance_type = local.type

 tags = {
   Name = local.name_tag,
 }
}
```

- Confirm

```sh
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## Input variables

- accept or assign values dynamically during runtime.
- define input values for modules that accept values on the fly from the parent module.

- `variables.tf`

```hcl
variable "ami" {
  type        = string
  description = "Ubuntu AMI ID"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
}
```

- update `main.tf`

```hcl
resource "aws_instance" "my_vm" {
  ami           = var.ami //Ubuntu AMI
  instance_type = var.instance_type

  tags = {
    Name = var.name_tag,
  }
}
```

- Execute

```sh
terraform plan
```

---

### Using Default Value

- `variable.tf`

```hcl
variable "ami" {
   type        = string
   description = "Ubuntu AMI ID in N. Virginia Region"
   default     = "ami-0a7d80731ae1b2435"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "My EC2 Instance"
}
```

---

## ??terraform.tfvars??

---

## Output Variables

- variable.tf

```hcl
variable "ami" {
  type        = string
  description = "Ubuntu AMI ID in N. Virginia Region"
  default     = "ami-0a7d80731ae1b2435"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "name_tag" {
  type        = string
  description = "Name of the EC2 instance"
  default     = "My EC2 Instance"
}

output "public_ip" {
  value       = aws_instance.my_vm.public_ip
  description = "Public IP Address of EC2 instance"
}

output "instance_id" {
  value       = aws_instance.my_vm.id
  description = "Instance ID"
}
```

- Execute

```sh
terraform fmt
terraform plan
# ...
# Changes to Outputs:
#   + instance_id = (known after apply)
#   + public_ip   = (known after apply)
# ...
terraform apply
# ...
# Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

# Outputs:

# instance_id = "i-0b75fd09c5bc4ad84"
# public_ip = "3.84.252.126"

terraform destroy -auto-approve
```
