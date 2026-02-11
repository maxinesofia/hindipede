module "vpc_module" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  last_name          = var.last_name
  first_name         = var.first_name
  project_code       = var.project_code
  availability_zones = var.availability_zones
}