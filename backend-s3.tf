terraform {
  backend "s3" {
    bucket = "terraform-rprofile-state"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}