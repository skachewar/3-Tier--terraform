/*vpc_id = module.vpc.vpc_id{}
public_subnet_id = module.vpc.public_subnet_id{}*/
variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}