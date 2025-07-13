# # Terraform - Configure Remote Backend

[Back](../../README.md)

- [# Terraform - Configure Remote Backend](#-terraform---configure-remote-backend)
  - [Define Remote Backend](#define-remote-backend)
  - [Define terraform provider](#define-terraform-provider)
  - [Initialize Terraform](#initialize-terraform)

---

## Define Remote Backend

```sh
mkdir -pv terraform
cd terraform
```

- Create cf `state.config`

```txt
# state.config
bucket = "your_backend_s3_bucket"
key    = "your_backend_s3_bucket_key" # example: "app_name/terraform.tfstate"
region = "your_backend_s3_bucket_region"
```

---

## Define terraform provider

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

---

## Initialize Terraform

```sh
terraform init -backend-config="./state.config" -migrate-state
```
