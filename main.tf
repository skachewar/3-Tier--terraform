module "vpc" {
  source = "./modules/vpc"
}

module "web" {
  source           = "./modules/web"
  vpc_id           = module.vpc.vpc_id
  /*public_subnet_id = element(module.vpc.public_subnet_ids, 0)*/
  public_subnet_id = module.vpc.public_subnet_id
  
}

module "app" {
  source            = "./modules/app"
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_id
  web_sg_id         = module.web.web_sg_id
  rds_endpoint = module.rds.db_endpoint
}


module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}