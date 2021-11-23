terraform {
  backend "s3" {
    bucket = "cr-pkp-keys"
    key    = "cr-pkp-keys/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}
