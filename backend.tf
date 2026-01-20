terraform {
  backend "s3" {
    bucket = "boa-terraform-state-im-jan25-vishwa"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "terraform-locks-vishwa"
  }
}