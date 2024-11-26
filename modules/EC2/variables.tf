variable "fridayhitt_instance_type" {
   description = "The instance type for the fridayhitt EC2 instance"
    type        = string
}

variable "fridayhitt_key_name" {
   description = "The Keyname for the EC2 fridayhitt instance"
  type        = string
}

variable "private_security_group_id" {
  description = "The private securtiy group id"
  type = string
}

variable "public_security_group_id" {
  description = "The public security group id"
  type = string
}

variable "jumpbox_security_group_id" {
  description = "The jumpbox security group id"
  type = string
}

variable "pub_sub_id" {
   description = "The public subnet id for the EC2 fridayhitt public instance"
  type        = string
}

variable "priv_sub_id" {
   description = "The private subne id for the fridayhitt private instance"
  type        = string
}

variable "fridayhitt_vpc_id" {
 description = "The VPC ID for the fridayhitt vpc"
  type        = string  
}

variable "ami_id" {
   description = "The AMI ID for the EC2 instance"
  type        = string
}
