# define data source
data "archive_file" "lambda_package" {
  type        = "zip"
  source_file = "index.js"
  output_path = "index.zip"
}

# define lambda role
resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# define lambda function
resource "aws_lambda_function" "html_lambda" {
  filename         = "index.zip"
  function_name    = "myLambdaFunction"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "nodejs22.x"
  source_code_hash = data.archive_file.lambda_package.output_base64sha256
}

# Attach basic execution policy to role
resource "aws_iam_role_policy_attachment" "lambda_basic" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_role.name
}

# Grant API Gateway permission to invoke Lambda
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.html_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # FIXED: More specific source ARN pattern
  source_arn = "${aws_api_gateway_rest_api.my_api.execution_arn}/*/*"
}
