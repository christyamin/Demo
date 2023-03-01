terraform {
  backend "s3" {
    bucket = "christyamin-app"
    region = "us-east-1"
    key    = "modules/terraform.tfstate"
  }
}