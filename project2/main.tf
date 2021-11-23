provider "aws" {
  region = "eu-west-1"
  access_key = "AKIAUSHUKNLM6YI3OPEF"
  secret_key = "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"

}




variable "subnet_prv1" {
  description = "Private Subnet 1"
  default = "subnet-0188709f33f3c4411"
}



resource "aws_instance" "my-first-ec2" {
  ami           = "ami-08edbb0e85d6a0a07"
  instance_type = "t2.micro"
  key_name = "CR_Key"
  vpc_security_group_ids = ["sg-0b02036a9e4489946"]
  subnet_id = "${var.subnet_prv1}"

  tags = {
    Name = "HelloWorld"
  }
}




# resource "aws_s3_bucket" "b" {
#   bucket = "my-tf-test-bucket-prageeth"
#   acl    = "private"

#   versioning {
#     enabled = true
#   }


#   tags = {
#     Name        = "talent-academy-tfstates"
#     Environment = "Test"
#   }
# }

# resource "aws_dynamodb_table" "terraform-lock-tbl" {
#   name           = "terraform-lock"
#   read_capacity  = 1
#   write_capacity = 1
#   hash_key       = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     Name = "terraform-lock"
#   }
# }