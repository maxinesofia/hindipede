module "vpc_module" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  last_name     = var.last_name
  activity_name = var.activity_name
}