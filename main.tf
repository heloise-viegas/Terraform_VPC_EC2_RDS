module "vpc" {
  source            = "./vpc"
  vpc_cidr_block    = var.vpc_cidr_block
  vpc_name          = var.vpc_name
  subnet_names      = var.subnet_names
  availability_zone = var.availability_zone
  igw_name          = var.igw_name
  nat_gateway_name  = var.nat_gateway_name
}

module "ec2" {
  source           = "./ec2"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
}

module "rds" {
  source             = "./rds"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_sg_id          = module.ec2.web_sg_id
}