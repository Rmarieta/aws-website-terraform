output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution."
  value       = aws_cloudfront_distribution.site.domain_name
}

output "bucket_name" {
  description = "Name of the private S3 bucket hosting frontend assets."
  value       = aws_s3_bucket.site.bucket
}