# terraform provider aws with shared_credentials_file
provider "aws" {
  version                 = "~> 4.0"
  region                  = "us-east-1"
  shared_credentials_file = ".aws/credentials"
}
