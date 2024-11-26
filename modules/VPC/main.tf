data "aws_availability_zones" "available_zones" {
    state = "available"
}

resource "aws_vpc" "fridayhitt_vpc" {
  cidr_block = var.fridayhitt_vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "fridayhitt_vpc"
  }
}

resource "aws_subnet" "fridayhitt_public_subnet" {
  vpc_id = aws_vpc.fridayhitt_vpc.id
  cidr_block = var.fridayhitt_public_subnet_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "fridayhitt_public_subnet"
  }
}

resource "aws_subnet" "fridayhitt_private_subnet" {
  vpc_id = aws_vpc.fridayhitt_vpc.id
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  cidr_block = var.fridayhitt_private_subnet_cidr
  map_public_ip_on_launch = false
  tags = {
    Name = "fridayhitt_private_subnet"
  }
}

resource "aws_internet_gateway" "fridayhitt_igw" {
    vpc_id = aws_vpc.fridayhitt_vpc.id
    tags = {
        Name = "fridayhitt_igw"
    }
}

resource "aws_route_table" "fridayhitt_Publicrt" {
    vpc_id = aws_vpc.fridayhitt_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.fridayhitt_igw.id
}
}

resource "aws_route_table_association" "fridayhitt_public_route_assoc" {
    subnet_id = aws_subnet.fridayhitt_public_subnet.id
    route_table_id = aws_route_table.fridayhitt_Publicrt.id
}

resource "aws_route_table" "fridayhitt_Privatert" {
    vpc_id = aws_vpc.fridayhitt_vpc.id
}

resource "aws_route_table_association" "fridayhitt_private_route_assoc" {
    subnet_id = aws_subnet.fridayhitt_private_subnet.id
    route_table_id = aws_route_table.fridayhitt_Privatert.id
}