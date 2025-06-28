# Create CNAME record pointing to S3 website endpoint
resource "cloudflare_record" "website_cname" {
  zone_id = data.cloudflare_zone.record_name.id
  name    = "testtf"
  type    = "CNAME"
  content = aws_s3_bucket_website_configuration.website_config.website_domain
  ttl     = 1
  proxied = true

  comment = "CNAME for S3 static website"
}

# # Output the Cloudflare-proxied URL
# output "cloudflare_website_url" {
#   description = "Website URL through Cloudflare"
#   value       = "https://${var.domain_name}"
# }
