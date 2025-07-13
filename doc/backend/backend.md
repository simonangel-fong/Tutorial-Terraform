# # Terraform - Configure Remote Backend

[Back](../../README.md)

- [# Terraform - Configure Remote Backend](#-terraform---configure-remote-backend)
  - [Remote Backend](#remote-backend)

---

## Remote Backend

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

- Initialize Terraform

```sh
terraform init -backend-config="./state.config" -migrate-state
```