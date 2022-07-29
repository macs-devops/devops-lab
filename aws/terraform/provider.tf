terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
  # shared_credentials_file = "/Users/maximiliano.florentin/.aws/credentials"
}
