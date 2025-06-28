# Enable static website hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Enable bucket public access block
resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  # block_public_acls       = true
  # ignore_public_acls      = true
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

# set ownership
resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_ownership,
    aws_s3_bucket_public_access_block.bucket_public_access
  ]

  bucket = aws_s3_bucket.my_bucket.id
  acl    = "public-read"
}

# Enable bucket policy for public read access
resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::${var.domain_name}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.bucket_public_access]
}


# =============================== Output ===============================
output "website_endpoint" {
  description = "Website endpoint for the S3 bucket"
  value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
}

output "website_domain" {
  description = "Domain of the website endpoint"
  value       = aws_s3_bucket_website_configuration.website_config.website_domain
}
