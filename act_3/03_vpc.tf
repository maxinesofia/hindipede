module "vpc_module" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  last_name     = var.last_name
  first_name    = var.first_name
  project_code  = var.project_code
  activity_name = var.activity_name
}
