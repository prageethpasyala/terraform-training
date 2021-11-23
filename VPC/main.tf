# VPC
resource "aws_vpc" "main_vpc" {
    # cidir_block = "192.168.0.0/16"
    cidr_block = var.vpc_cidr
tags = {
    Name = var.vpc_name
    # Name = "talent-academy-main-vpc"
}
}

# IG
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    # Name = "talent-academy-internet-gateway"
    Name = var.internet_gw_name
  }
}

# SUBNET
# PUBLIC
resource "aws_subnet" "main_public_1a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_a_cidr
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = true    
    tags = {
    Name = "main_public_1a"
  }
}
