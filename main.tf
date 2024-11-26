#provider
terraform {
  backend "s3" {
    bucket = "store-tf-state-file-lab2"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}


module "vpc" {
  source = "./modules/VPC"
  fridayhitt_vpc_cidr = var.fridayhitt_vpc_cidr
  fridayhitt_public_subnet_cidr = var.fridayhitt_public_subnet_cidr
  fridayhitt_private_subnet_cidr = var.fridayhitt_private_subnet_cidr
}

module "ec2" {
  source = "./modules/EC2"
  ami_id = var.ami_id
  fridayhitt_instance_type = var.fridayhitt_instance_type
  fridayhitt_key_name = var.fridayhitt_key_name
  priv_sub_id = module.vpc.fridayhitt_private_subnet_id
  pub_sub_id = module.vpc.fridayhitt_public_subnet_id
  fridayhitt_vpc_id =  module.vpc.fridayhitt_vpc_id
  public_security_group_id =  module.security.public_security_group_id
  private_security_group_id = module.security.private_security_group_id
  jumpbox_security_group_id = module.security.jumpbox_security_group_id
}

module "security" {
  source = "./modules/Securtiy"
  fridayhitt_securtiy = module.vpc.fridayhitt_vpc_id
}