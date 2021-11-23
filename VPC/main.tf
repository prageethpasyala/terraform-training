# ---------VPC---------
resource "aws_vpc" "main_vpc" {
    # cidir_block = "192.168.0.0/16"
    cidr_block = var.vpc_cidr
tags = {
    Name = var.vpc_name
    # Name = "talent-academy-main-vpc"
}
}

# ---------IG----------
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    # Name = "talent-academy-internet-gateway"
    Name = var.internet_gw_name
  }
}

# ------SUBNET----------
# PUBLIC
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_a_cidr
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = true    
    tags = {
    Name = "main_public_1a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_b_cidr
    availability_zone = "${var.region}b"
    map_public_ip_on_launch = true    
    tags = {
    Name = "main_public_1b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_c_cidr
    availability_zone = "${var.region}c"
    map_public_ip_on_launch = true    
    tags = {
    Name = "main_public_1c"
  }
}

# PRIVATE
resource "aws_subnet" "main_private_1a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_a_cidr
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = false    
    tags = {
    Name = "main_private_1a"
  }
}

resource "aws_subnet" "main_private_1b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_b_cidr
    availability_zone = "${var.region}b"
    map_public_ip_on_launch = false    
    tags = {
    Name = "main_private_1b"
  }
}

resource "aws_subnet" "main_private_1c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_c_cidr
    availability_zone = "${var.region}c"
    map_public_ip_on_launch = false    
    tags = {
    Name = "main_private_1c"
  }
}

# -------------NAT---------------
# ELASTIC IP
resource "aws_eip" "nat_a_eip" {
    vpc = true
}
# nat public a
resource "aws_nat_gateway" "nat_a" {
    allocation_id = aws_eip.nat_a_eip.id
    subnet_id = aws_subnet.public_a.id
  
  tags ={
      Name = "NAT Gateway a public"
  }
# wait untill internet gateway to be completed to perform NAT
  depends_on = [
    aws_internet_gateway.gw
  ]
}


# ELASTIC IP
resource "aws_eip" "nat_b_eip" {
    vpc = true
}
# nat public b
resource "aws_nat_gateway" "nat_b" {
    allocation_id = aws_eip.nat_b_eip.id
    subnet_id = aws_subnet.public_b.id
  
  tags ={
      Name = "NAT Gateway b public"
  }
# wait untill internet gateway to be completed to perform NAT
  depends_on = [
    aws_internet_gateway.gw
  ]
}


# ELASTIC IP
resource "aws_eip" "nat_c_eip" {
    vpc = true
}
# nat public c
resource "aws_nat_gateway" "nat_c" {
    allocation_id = aws_eip.nat_c_eip.id
    subnet_id = aws_subnet.public_c.id
  
  tags ={
      Name = "NAT Gateway c public"
  }
# wait untill internet gateway to be completed to perform NAT
  depends_on = [
    aws_internet_gateway.gw
  ]
}