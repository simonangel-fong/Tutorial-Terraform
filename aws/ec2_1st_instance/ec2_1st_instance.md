# Terraform AWS - EC2 1st Instance

[Back](../../README.md)

- [Terraform AWS - EC2 1st Instance](#terraform-aws---ec2-1st-instance)
  - [Set up the Terraform provider](#set-up-the-terraform-provider)
  - [Define Resource](#define-resource)
  - [Apply](#apply)

---

## Set up the Terraform provider

- `provider.tf`

```sh
terraform init
```

---

## Define Resource

- `main.tf`

- resource type: aws_instance

```hcl
# Specify resource type
resource "aws_instance" "my_vm" {
  ami           = "ami-0a7d80731ae1b2435" //Ubuntu AMI
  instance_type = "t2.micro"

  tags = {
    Name = "My EC2 instance",
  }
}
```

---

## Apply

```sh
# format tf file
terraform fmt

terraform validate
# Success! The configuration is valid.

# Shows the execution plan
terraform plan
# Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
# symbols:
#   + create

# Terraform will perform the following actions:

#   # aws_instance.my_vm will be created
#   + resource "aws_instance" "my_vm" {
#       + ami                                  = "ami-0a7d80731ae1b2435"
#       + arn                                  = (known after apply)
#       + associate_public_ip_address          = (known after apply)
#       + availability_zone                    = (known after apply)
#       + disable_api_stop                     = (known after apply)
#       + disable_api_termination              = (known after apply)
#       + ebs_optimized                        = (known after apply)
#       + enable_primary_ipv6                  = (known after apply)
#       + get_password_data                    = false
#       + host_id                              = (known after apply)
#       + host_resource_group_arn              = (known after apply)
#       + iam_instance_profile                 = (known after apply)
#       + id                                   = (known after apply)
#       + instance_initiated_shutdown_behavior = (known after apply)
#       + instance_lifecycle                   = (known after apply)
#       + instance_state                       = (known after apply)
#       + instance_type                        = "t2.micro"
#       + ipv6_address_count                   = (known after apply)
#       + ipv6_addresses                       = (known after apply)
#       + key_name                             = (known after apply)
#       + monitoring                           = (known after apply)
#       + outpost_arn                          = (known after apply)
#       + password_data                        = (known after apply)
#       + placement_group                      = (known after apply)
#       + placement_partition_number           = (known after apply)
#       + primary_network_interface_id         = (known after apply)
#       + private_dns                          = (known after apply)
#       + private_ip                           = (known after apply)
#       + public_dns                           = (known after apply)
#       + public_ip                            = (known after apply)
#       + region                               = "us-east-1"
#       + secondary_private_ips                = (known after apply)
#       + security_groups                      = (known after apply)
#       + source_dest_check                    = true
#       + spot_instance_request_id             = (known after apply)
#       + subnet_id                            = (known after apply)
#       + tags                                 = {
#           + "Name" = "My EC2 instance"
#         }
#       + tags_all                             = {
#           + "Name" = "My EC2 instance"
#         }
#       + tenancy                              = (known after apply)
#       + user_data_base64                     = (known after apply)
#       + user_data_replace_on_change          = false
#       + vpc_security_group_ids               = (known after apply)

#       + capacity_reservation_specification (known after apply)

#       + cpu_options (known after apply)

#       + ebs_block_device (known after apply)

#       + enclave_options (known after apply)

#       + ephemeral_block_device (known after apply)

#       + instance_market_options (known after apply)

#       + maintenance_options (known after apply)

#       + metadata_options (known after apply)

#       + network_interface (known after apply)

#       + private_dns_name_options (known after apply)

#       + root_block_device (known after apply)
#     }

# Plan: 1 to add, 0 to change, 0 to destroy.

# ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

# Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform
# apply" now.

# show plan state
terraform show
# No state.

# Provision resources
terraform apply
# Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
# symbols:
#   + create

# Terraform will perform the following actions:

#   # aws_instance.my_vm will be created
#   + resource "aws_instance" "my_vm" {
#       + ami                                  = "ami-0a7d80731ae1b2435"
#       + arn                                  = (known after apply)
#       + associate_public_ip_address          = (known after apply)
#       + availability_zone                    = (known after apply)
#       + disable_api_stop                     = (known after apply)
#       + disable_api_termination              = (known after apply)
#       + ebs_optimized                        = (known after apply)
#       + enable_primary_ipv6                  = (known after apply)
#       + get_password_data                    = false
#       + host_id                              = (known after apply)
#       + host_resource_group_arn              = (known after apply)
#       + iam_instance_profile                 = (known after apply)
#       + id                                   = (known after apply)
#       + instance_initiated_shutdown_behavior = (known after apply)
#       + instance_lifecycle                   = (known after apply)
#       + instance_state                       = (known after apply)
#       + instance_type                        = "t2.micro"
#       + ipv6_address_count                   = (known after apply)
#       + ipv6_addresses                       = (known after apply)
#       + key_name                             = (known after apply)
#       + monitoring                           = (known after apply)
#       + outpost_arn                          = (known after apply)
#       + password_data                        = (known after apply)
#       + placement_group                      = (known after apply)
#       + placement_partition_number           = (known after apply)
#       + primary_network_interface_id         = (known after apply)
#       + private_dns                          = (known after apply)
#       + private_ip                           = (known after apply)
#       + public_dns                           = (known after apply)
#       + public_ip                            = (known after apply)
#       + region                               = "us-east-1"
#       + secondary_private_ips                = (known after apply)
#       + security_groups                      = (known after apply)
#       + source_dest_check                    = true
#       + spot_instance_request_id             = (known after apply)
#       + subnet_id                            = (known after apply)
#       + tags                                 = {
#           + "Name" = "My EC2 instance"
#         }
#       + tags_all                             = {
#           + "Name" = "My EC2 instance"
#         }
#       + tenancy                              = (known after apply)
#       + user_data_base64                     = (known after apply)
#       + user_data_replace_on_change          = false
#       + vpc_security_group_ids               = (known after apply)

#       + capacity_reservation_specification (known after apply)

#       + cpu_options (known after apply)

#       + ebs_block_device (known after apply)

#       + enclave_options (known after apply)

#       + ephemeral_block_device (known after apply)

#       + instance_market_options (known after apply)

#       + maintenance_options (known after apply)

#       + metadata_options (known after apply)

#       + network_interface (known after apply)

#       + private_dns_name_options (known after apply)

#       + root_block_device (known after apply)
#     }

# Plan: 1 to add, 0 to change, 0 to destroy.
# aws_instance.my_vm: Creating...
# aws_instance.my_vm: Still creating... [10s elapsed]
# aws_instance.my_vm: Still creating... [20s elapsed]
# aws_instance.my_vm: Still creating... [30s elapsed]
# aws_instance.my_vm: Creation complete after 34s [id=i-0c6e97f8e0e06bc1a]

# Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

terraform show
# # aws_instance.my_vm:
# resource "aws_instance" "my_vm" {
#     ami                                  = "ami-0a7d80731ae1b2435"
#     arn                                  = "arn:aws:ec2:us-east-1:099139718958:instance/i-0c6e97f8e0e06bc1a"
#     associate_public_ip_address          = true
#     availability_zone                    = "us-east-1d"
#     disable_api_stop                     = false
#     disable_api_termination              = false
#     ebs_optimized                        = false
#     get_password_data                    = false
#     hibernation                          = false
#     host_id                              = null
#     iam_instance_profile                 = null
#     id                                   = "i-0c6e97f8e0e06bc1a"
#     instance_initiated_shutdown_behavior = "stop"
#     instance_lifecycle                   = null
#     instance_state                       = "running"
#     instance_type                        = "t2.micro"
#     ipv6_address_count                   = 0
#     ipv6_addresses                       = []
#     key_name                             = null
#     monitoring                           = false
#     outpost_arn                          = null
#     password_data                        = null
#     placement_group                      = null
#     placement_partition_number           = 0
#     primary_network_interface_id         = "eni-099ae5858393980fe"
#     private_dns                          = "ip-172-31-95-170.ec2.internal"
#     private_ip                           = "172.31.95.170"
#     public_dns                           = "ec2-13-220-161-15.compute-1.amazonaws.com"
#     public_ip                            = "13.220.161.15"
#     region                               = "us-east-1"
#     secondary_private_ips                = []
#     security_groups                      = [
#         "default",
#     ]
#     source_dest_check                    = true
#     spot_instance_request_id             = null
#     subnet_id                            = "subnet-0d5ab00a11ada3219"
#     tags                                 = {
#         "Name" = "My EC2 instance"
#     }
#     tags_all                             = {
#         "Name" = "My EC2 instance"
#     }
#     tenancy                              = "default"
#     user_data_replace_on_change          = false
#     vpc_security_group_ids               = [
#         "sg-0b6d492efa10de2fe",
#     ]

#     capacity_reservation_specification {
#         capacity_reservation_preference = "open"
#     }

#     cpu_options {
#         amd_sev_snp      = null
#         core_count       = 1
#         threads_per_core = 1
#     }

#     credit_specification {
#         cpu_credits = "standard"
#     }

#     enclave_options {
#         enabled = false
#     }

#     maintenance_options {
#         auto_recovery = "default"
#     }

#     metadata_options {
#         http_endpoint               = "enabled"
#         http_protocol_ipv6          = "disabled"
#         http_put_response_hop_limit = 1
#         http_tokens                 = "optional"
#         instance_metadata_tags      = "disabled"
#     }

#     private_dns_name_options {
#         enable_resource_name_dns_a_record    = false
#         enable_resource_name_dns_aaaa_record = false
#         hostname_type                        = "ip-name"
#     }

#     root_block_device {
#         delete_on_termination = true
#         device_name           = "/dev/sda1"
#         encrypted             = false
#         iops                  = 100
#         kms_key_id            = null
#         tags                  = {}
#         tags_all              = {}
#         throughput            = 0
#         volume_id             = "vol-07bcebd2adf5379a6"
#         volume_size           = 8
#         volume_type           = "gp2"
#     }
# }

terraform destroy
# aws_instance.my_vm: Refreshing state... [id=i-0c6e97f8e0e06bc1a]

# Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
# symbols:
#   - destroy

# Terraform will perform the following actions:

#   # aws_instance.my_vm will be destroyed
#   - resource "aws_instance" "my_vm" {
#       - ami                                  = "ami-0a7d80731ae1b2435" -> null
#       - arn                                  = "arn:aws:ec2:us-east-1:099139718958:instance/i-0c6e97f8e0e06bc1a" -> null
#       - associate_public_ip_address          = true -> null
#       - availability_zone                    = "us-east-1d" -> null
#       - disable_api_stop                     = false -> null
#       - disable_api_termination              = false -> null
#       - ebs_optimized                        = false -> null
#       - get_password_data                    = false -> null
#       - hibernation                          = false -> null
#       - id                                   = "i-0c6e97f8e0e06bc1a" -> null
#       - instance_initiated_shutdown_behavior = "stop" -> null
#       - instance_state                       = "running" -> null
#       - instance_type                        = "t2.micro" -> null
#       - ipv6_address_count                   = 0 -> null
#       - ipv6_addresses                       = [] -> null
#       - monitoring                           = false -> null
#       - placement_partition_number           = 0 -> null
#       - primary_network_interface_id         = "eni-099ae5858393980fe" -> null
#       - private_dns                          = "ip-172-31-95-170.ec2.internal" -> null
#       - private_ip                           = "172.31.95.170" -> null
#       - public_dns                           = "ec2-13-220-161-15.compute-1.amazonaws.com" -> null
#       - public_ip                            = "13.220.161.15" -> null
#       - region                               = "us-east-1" -> null
#       - secondary_private_ips                = [] -> null
#       - security_groups                      = [
#           - "default",
#         ] -> null
#       - source_dest_check                    = true -> null
#       - subnet_id                            = "subnet-0d5ab00a11ada3219" -> null
#       - tags                                 = {
#           - "Name" = "My EC2 instance"
#         } -> null
#       - tags_all                             = {
#           - "Name" = "My EC2 instance"
#         } -> null
#       - tenancy                              = "default" -> null
#       - user_data_replace_on_change          = false -> null
#       - vpc_security_group_ids               = [
#           - "sg-0b6d492efa10de2fe",
#         ] -> null
#         # (8 unchanged attributes hidden)

#       - capacity_reservation_specification {
#           - capacity_reservation_preference = "open" -> null
#         }

#       - cpu_options {
#           - core_count       = 1 -> null
#           - threads_per_core = 1 -> null
#             # (1 unchanged attribute hidden)
#         }

#       - credit_specification {
#           - cpu_credits = "standard" -> null
#         }

#       - enclave_options {
#           - enabled = false -> null
#         }

#       - maintenance_options {
#           - auto_recovery = "default" -> null
#         }

#       - metadata_options {
#           - http_endpoint               = "enabled" -> null
#           - http_protocol_ipv6          = "disabled" -> null
#           - http_put_response_hop_limit = 1 -> null
#           - http_tokens                 = "optional" -> null
#           - instance_metadata_tags      = "disabled" -> null
#         }

#       - private_dns_name_options {
#           - enable_resource_name_dns_a_record    = false -> null
#           - enable_resource_name_dns_aaaa_record = false -> null
#           - hostname_type                        = "ip-name" -> null
#         }

#       - root_block_device {
#           - delete_on_termination = true -> null
#           - device_name           = "/dev/sda1" -> null
#           - encrypted             = false -> null
#           - iops                  = 100 -> null
#           - tags                  = {} -> null
#           - tags_all              = {} -> null
#           - throughput            = 0 -> null
#           - volume_id             = "vol-07bcebd2adf5379a6" -> null
#           - volume_size           = 8 -> null
#           - volume_type           = "gp2" -> null
#             # (1 unchanged attribute hidden)
#         }
#     }

# Plan: 0 to add, 0 to change, 1 to destroy.

# Do you really want to destroy all resources?
#   Terraform will destroy all your managed infrastructure, as shown above.
#   There is no undo. Only 'yes' will be accepted to confirm.

#   Enter a value: yes

# aws_instance.my_vm: Destroying... [id=i-0c6e97f8e0e06bc1a]
# aws_instance.my_vm: Still destroying... [id=i-0c6e97f8e0e06bc1a, 10s elapsed]
# aws_instance.my_vm: Still destroying... [id=i-0c6e97f8e0e06bc1a, 20s elapsed]
# aws_instance.my_vm: Still destroying... [id=i-0c6e97f8e0e06bc1a, 30s elapsed]
# aws_instance.my_vm: Still destroying... [id=i-0c6e97f8e0e06bc1a, 40s elapsed]
# aws_instance.my_vm: Destruction complete after 41s

# Destroy complete! Resources: 1 destroyed.
```
