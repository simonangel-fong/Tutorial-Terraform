# Tutorial-Terraform

A repo to learn Terraform

---

## Fundamental

- [Fundamental](./doc/fundamental/fundamental.md)
- [Configure Remote Backend](./doc/backend/backend.md)

## Common Commands

| CMD                             | DESC                                                                  |
| ------------------------------- | --------------------------------------------------------------------- |
| `terraform init`                | Initializes the working directory and downloads provider plugins      |
| `terraform init -upgrade`       | Updates the provider                                                  |
| `terraform validate`            | Validates the configuration files for syntax errors                   |
| `terraform fmt`                 | Formats configuration files to the canonical style                    |
| `terraform plan`                | Shows the execution plan                                              |
| `terraform show`                | Displays the current state or a plan                                  |
| `terraform apply`               | Provision all the declared resources                                  |
| `terraform apply -auto-approve` | Provision all the declared resources without asking for confirmation. |
| `terraform destroy`             | Destroys all infrastructure managed by Terraform                      |
| `terraform output`              | Shows output values from the state file                               |
| `terraform state list`          | Lists all resources tracked in the state file                         |
| `terraform state show`          | Shows details of a specific resource from the state                   |
| `terraform taint`               | Marks a resource for recreation in the next `apply`                   |
| `terraform untaint`             | Removes the taint from a resource                                     |
| `terraform import`              | Imports existing infrastructure into Terraform state                  |
| `terraform workspace list`      | Lists available workspaces                                            |
| `terraform workspace new`       | Creates a new workspace                                               |
| `terraform workspace select`    | Switches to another workspace                                         |

---

## AWS

- [Configuration](./aws/configuration/configuration.md)
- S3

  - [Web site + cloudflare](./aws_s3/web_host_cloudflare/web_host_cloudflare.md)

- EC2

  - [1st Project - Creating an EC2 Instance](./aws/ec2_1st_instance/ec2_1st_instance.md)
  - [Using Variable](./aws/ec2_variable/ec2_variable.md)

- ECS

  - [Nginx Container](./aws_ecs/nginx/nginx.md)

- API + Lambda

  - [1st API + Lambda](./aws/api_lambda/api_lambda.md)

- AWS Lambda
  - [Layer](./aws_lambda/layer/layer.md)

---

## Cloudflare

- [DNS](./cloudflare/dns/dns.md)

---

## Docs

- AWS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

  - EC2: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

- Cloudflare: https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
