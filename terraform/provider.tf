# terraform provider aws with shared_credentials_file
provider "aws" {
  version                 = "~> 2.0"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terraform"
  region                  = "us-east-1"
}
