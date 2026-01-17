variable "project_name" {
  description = "Logical name of the project used for resource naming and tagging."
  type        = string
}

variable "bucket_name" {
  description = "Name of the private S3 bucket hosting frontend assets. Must be globally unique."
  type        = string
}

variable "tags" {
  description = "Map of tags applied to all resources."
  type        = map(string)
  default     = {}
}