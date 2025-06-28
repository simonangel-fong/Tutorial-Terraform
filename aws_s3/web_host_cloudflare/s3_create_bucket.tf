resource "aws_s3_bucket" "my_bucket" {
  # bucket = "my-unique-bucket-name-${random_string.bucket_suffix.result}"
  bucket = var.domain_name

  tags = {
    Name     = "My new bucket"
    resource = "S3"
  }
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Enabe bucket versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# =============================== Output ===============================
output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.arn
}
