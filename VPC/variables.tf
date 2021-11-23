# VPC
variable "vpc_cidr" {
  description = "the CIDR of my VPC"
  type = string
}

variable "vpc_name" {
    description = "The name of my vpc"
    type = string
}

# IG
variable "internet_gw_name" {
  description = "the name of the IG"
  type = string
}

# REGION
variable "region" {
  description = "Default regoin of our VPC"
  type = string
}


# SUBNET PUBLIC
variable "public_a_cidr" {
    description = "CIDR of the public subnet a"
    type = string
}
variable "public_b_cidr" {
    description = "CIDR of the public subnet b"
    type = string
  
}
variable "public_c_cidr" {
    description = "CIDR of the public subnet c"
    type = string
  
}

# PRIVATE SUBNET
variable "private_a_cidr" {
    description = "CIDR of the private subnet a"
    type = string
}
variable "private_b_cidr" {
    description = "CIDR of the private subnet b"
    type = string
}
variable "private_c_cidr" {
    description = "CIDR of the private subnet c"
    type = string
}