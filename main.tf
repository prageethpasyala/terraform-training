resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-prageeth"
  acl    = "private"

  versioning {
    enabled = true
  }


  tags = {
    Name        = "talent-academy-tfstates"
    Environment = "Test"
  }
}

resource "aws_dynamodb_table" "terraform-lock-tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock"
  }
}