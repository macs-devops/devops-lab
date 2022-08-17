terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "terraform-tfstate-593043004533"
    key            = "deploy/terraform.tfstate"
    dynamodb_table = "terraform-tfstate-593043004533-lock"
    profile        = "max-devops-admº"
    role_arn       = "arn:aws:iam::593043004533:role/terraform-github-action"
    encrypt        = "true"
  }
}
