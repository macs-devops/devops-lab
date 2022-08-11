module "backend" {
  source         = "github.com/maxflorentin/terraform-aws-backend"
  backend_bucket = "tf-state-max-devops"
}

terraform {
  backend "s3" {
    bucket         = "tf-state-max-devops" # "max-devops-tfstate"
    key            = "states/terraform.tfstate"
    dynamodb_table = "tf-lock"
    encrypt        = true
    region         = "us-east-1"
    profile        = "max-devops-adm"
  }
}

