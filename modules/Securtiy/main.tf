resource "aws_security_group" "fridayhitt_public_security_group" {
  description = "Pubic Security group for fridayhitt"
  vpc_id = var.fridayhitt_securtiy
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.fridayhitt_jumpbox_security_group.id]
  }
  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "fridayhitt_private_security_group" {
    vpc_id = var.fridayhitt_securtiy

    #traffic for private ec2 instance ssh via jumpbox
    ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    security_groups = [aws_security_group.fridayhitt_jumpbox_security_group.id]
    }
  
}

resource "aws_security_group" "fridayhitt_jumpbox_security_group" {
    vpc_id = var.fridayhitt_securtiy

    #traffic for private ec2 instance ssh via jumpbox
    ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
