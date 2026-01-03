module "tfstate-backend" {
  source  = "cloudposse/tfstate-backend/aws"
  version = "1.8.0"

  namespace = xxxxx
  name      = xxxxx
}

output "terraform_backend_config" {
  value = module.tfstate-backend.xxxxx
}
