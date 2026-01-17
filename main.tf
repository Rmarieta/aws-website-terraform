module "frontend" {
  source = "./modules/frontend"

  project_name = var.project_name
  bucket_name  = var.frontend_bucket_name
  tags         = local.common_tags
}
