module "backend" {
  source         = "github.com/maxflorentin/terraform-aws-backend"
  backend_bucket = "max-devops-tfstate"
}

terraform {
  backend "s3" {
    bucket         = "max-devops-tfstate"
    key            = "states/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    region         = "us-east-1"
    profile        = "max-devops-adm"
  }
}

