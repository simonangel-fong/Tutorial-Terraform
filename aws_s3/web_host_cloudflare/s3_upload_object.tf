# resource "aws_s3_object" "object" {
#   bucket       = aws_s3_bucket.my_bucket.id
#   key          = "index.html"
#   source       = "index.html"
#   content_type = "text/html"

#   etag = filemd5("index.html")
# }

module "template_files" {
  source = "hashicorp/dir/template"

  base_dir = "${path.module}/web_file"
}

# AWS S3 object resource for hosting bucket files
resource "aws_s3_object" "Bucket_files" {
  bucket = aws_s3_bucket.my_bucket.id

  # loop all files
  for_each     = module.template_files.files
  key          = each.key
  content_type = each.value.content_type

  source  = each.value.source_path
  content = each.value.content

  # ETag of the S3 object
  etag = each.value.digests.md5
}
