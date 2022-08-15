# terraform provider aws with shared_credentials_file
provider "aws" {
  version    = "~> 4.0"
  region     = "us-east-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
