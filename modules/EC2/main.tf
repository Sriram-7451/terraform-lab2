resource "aws_instance" "fridayhitt_public_instance" {
  instance_type = var.fridayhitt_instance_type
  key_name = var.fridayhitt_key_name
  subnet_id = var.pub_sub_id
  vpc_security_group_ids = [ var.public_security_group_id ]
  ami = var.ami_id
  tags = {
    Name = "FridayHitt-Public-Instance"
  }
}

resource "aws_instance" "fridayhitt_private_instance" {
  instance_type = var.fridayhitt_instance_type
  key_name = var.fridayhitt_key_name
  subnet_id = var.priv_sub_id
  vpc_security_group_ids = [ var.private_security_group_id ]
  ami = var.ami_id
  tags = {
    Name = "FridayHitt-Private-Instance"
  }
}

resource "aws_instance" "fridayhitt_jumpbox_instance" {
  instance_type = var.fridayhitt_instance_type
  key_name = var.fridayhitt_key_name
  subnet_id = var.pub_sub_id
  vpc_security_group_ids = [ var.jumpbox_security_group_id ]
  ami = var.ami_id
  tags = {
    Name = "FridayHitt-Jumpbox-Instance"
  }
}
