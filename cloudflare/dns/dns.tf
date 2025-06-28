resource "cloudflare_record" "test" {
  zone_id = data.cloudflare_zone.arguswatcher.id
  name    = "test"
  content = "aws_api"
  type    = "CNAME"
  ttl     = 1
  proxied = true # Set to true if you want Cloudflare's proxy features
}

# Output the record details
output "dns_record_fqdn" {
  description = "The FQDN of the created DNS record"
  value       = cloudflare_record.test.hostname
}

output "dns_record_id" {
  description = "The ID of the created DNS record"
  value       = cloudflare_record.test.id
}
