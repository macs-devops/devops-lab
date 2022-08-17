data "aws_caller_identity" "current" {}

# Our bootstrap action does the right steps to initialize backend state with
# this module.
module "remote_state" {
  source  = "cloudposse/tfstate-backend/aws"
  version = "= 0.38.1"

  namespace  = var.namespace
  name       = "tfstate"
  attributes = [data.aws_caller_identity.current.account_id]

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  terraform_state_file               = "deploy/terraform.tfstate"
  force_destroy                      = false
}
