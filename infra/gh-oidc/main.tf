locals {
  role_name = "${var.namespace}-github-action"
}

module "iam_role" {
  source  = "unfunco/oidc-github/aws"
  version = "0.6.0"

  attach_read_only_policy = false
  iam_role_name           = local.role_name
  iam_role_policy_arns    = ["arn:aws:iam::593043004533:policy/terraform-github-action-main", "arn:aws:iam::593043004533:policy/terraform-github-action-bootstrap"]
  github_repositories     = ["${var.github_org}/${var.github_repo}"]
}

data "aws_caller_identity" "current" {}
