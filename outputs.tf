output "frontend_url" {
  description = "Public URL of the frontend CloudFront distribution."
  value       = "https://${module.frontend.cloudfront_domain_name}"
}
