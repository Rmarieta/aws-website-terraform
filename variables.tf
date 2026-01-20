variable "aws_region" {
  description = "AWS region where all resources will be deployed."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Logical name of the project used for resource naming and tagging."
  type        = string
  default     = "static-website-s3"
}

variable "frontend_bucket_name" {
  description = "Name of the S3 bucket hosting the frontend assets."
  type        = string
}
