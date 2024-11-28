resource "aws_s3_bucket" "bestassistantfrontend" {
  bucket = "bestassistantfrontenddev2"

  tags = {
    Name        = "bestassistantfrontend"
    Environment = "dev"
  }
}

# Website configuration
resource "aws_s3_bucket_website_configuration" "bestassistantfrontend-config" {
  bucket = aws_s3_bucket.bestassistantfrontend.id

  index_document {
    suffix = "index.html"
  }
}

# S3 permissions
resource "aws_s3_bucket_ownership_controls" "bucket-ownership" {
  bucket = aws_s3_bucket.bestassistantfrontend.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# S3 public access - Disabling anything that prevent public access
resource "aws_s3_bucket_public_access_block" "bucket-public-access" {
  bucket = aws_s3_bucket.bestassistantfrontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# S3 ACL
resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.bestassistantfrontend.id

  acl = "public-read"

  depends_on = [aws_s3_bucket_ownership_controls.bucket-ownership, aws_s3_bucket_public_access_block.bucket-public-access]
}

# S3 Bucket Policy
resource "aws_s3_bucket_policy" "bestassistantfrontend_policy" {
  bucket = aws_s3_bucket.bestassistantfrontend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.bestassistantfrontend.arn}/*"
      }
    ]
  })
}
