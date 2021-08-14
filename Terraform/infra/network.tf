locals {
  config = jsondecode(file("../configs/network.auto.tfvars.json"))
}


module "network" {
  source = "../modules/network"
  config = local.config  
  vpc_cidr_block   = "10.0.0.0/16"
  vpc_enable_ipv6  = false
  subnet_public_1a_cidr                = "10.0.176.0/22"
  subnet_backend_1a_cidr               = "10.0.0.0/19"
  cidr_allow_private                   = ["10.0.0.0/8"]
}