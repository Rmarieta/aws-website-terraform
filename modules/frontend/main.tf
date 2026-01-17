# ----------------------
# Private S3 bucket
# ----------------------
resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket = aws_s3_bucket.site.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ----------------------
# CloudFront Origin Access Control (OAC)
# ----------------------
resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "${local.name_prefix}-oac"
  description                       = "OAC for the S3 bucket" 
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# ----------------------
# CloudFront Distribution
# ----------------------
resource "aws_cloudfront_distribution" "site" {
  origin {
    domain_name              = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id                = local.s3_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  enabled             = true
  default_root_object = "index.html"
  comment             = "${local.name_prefix} distribution"
  price_class = "PriceClass_100"

  default_cache_behavior {
    target_origin_id       = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = var.tags
}

# ----------------------
# S3 bucket policy for CloudFront access
# ----------------------
resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.bucket
  policy = data.aws_iam_policy_document.bucket_policy.json
}
