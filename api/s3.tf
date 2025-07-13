# ################################
# Define S3 bucket
# ################################

resource "aws_s3_bucket" "bucket_data" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "bucket-${var.s3_bucket_name}"
  }
}

# Enabe bucket versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket_data.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ################################
# Upload data
# ################################

module "template_files" {
  source = "hashicorp/dir/template"

  base_dir = "${path.module}/${var.data_dir}"
}

# AWS S3 object resource for hosting bucket files
resource "aws_s3_object" "Bucket_files" {
  bucket = aws_s3_bucket.bucket_data.id

  # loop all files
  for_each     = module.template_files.files
  key          = each.key
  content_type = each.value.content_type

  source  = each.value.source_path
  content = each.value.content

  # ETag of the S3 object
  etag = each.value.digests.md5
}
