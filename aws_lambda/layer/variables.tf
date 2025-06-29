variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ca-central-1"
}

variable "lambda_function_name" {
  type        = string
  description = "AWS lambda function name"
  default     = "chatbot"
}
