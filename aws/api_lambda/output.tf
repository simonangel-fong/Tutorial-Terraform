output "cognito_user_pool_id" {
  value       = aws_cognito_user_pool.pool.id
  description = "Cognito user pool id"
}

output "aws_cognito_user_pool_client" {
  value       = aws_cognito_user_pool_client.client.id
  description = "Cognito client id"
}