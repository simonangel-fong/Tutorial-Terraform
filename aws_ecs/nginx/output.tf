# Outputs
output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = aws_lb.app_alb.dns_name
}

output "nginx_url" {
  description = "URL to access the nginx application"
  value       = "http://${aws_lb.app_alb.dns_name}"
}
