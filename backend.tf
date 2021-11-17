terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-prageeth"
    key    = "sprint1/week2/training-terraform/terraform.tfstates"
    dynamodb_table = "terraform-lock"

  }
}