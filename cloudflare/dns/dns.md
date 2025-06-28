# Terraform - Cloudflare

[Back](../../README.md)

- [Terraform - Cloudflare](#terraform---cloudflare)
  - [Init](#init)

---

## Init

```hcl
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
```
