terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 0.14"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "max-devops"

    workspaces {
      name = "github_actions"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
