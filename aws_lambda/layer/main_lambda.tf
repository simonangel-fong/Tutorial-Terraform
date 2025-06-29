# Lambda function
resource "aws_lambda_function" "chatbot" {
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  filename         = data.archive_file.lambda_zip.output_path
  handler          = "main.lambda_handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  timeout          = 30

  # layer
  layers = [aws_lambda_layer_version.lambda_layer.arn]

  runtime = "python3.11"

  tags = {
    Name        = var.lambda_function_name
    Environment = "production"
  }
}

# Package the Lambda function code
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/main.py"
  output_path = "${path.module}/function.zip"
}

# Common dependencies layer
resource "aws_lambda_layer_version" "lambda_layer" {
  layer_name          = "chatbot_dependencies_layer"
  filename            = "./lambda/layer.zip"
  description         = "Chatbot dependencies for Lambda functions"
  compatible_runtimes = ["python3.11"]

  compatible_architectures = ["x86_64"]

}
