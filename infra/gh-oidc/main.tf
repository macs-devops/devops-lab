locals {
  role_name        = "${var.namespace}-github-action"
  main_policy_arns = [aws_iam_policy.main.arn]
  policy_arns      = var.bootstrap_enabled ? concat(local.main_policy_arns, [aws_iam_policy.bootstrap.arn]) : local.main_policy_arns
}

module "iam_role" {
  source  = "unfunco/oidc-github/aws"
  version = "0.6.0"

  attach_read_only_policy = false
  iam_role_name           = local.role_name
  iam_role_policy_arns    = local.policy_arns
  github_repositories     = ["${var.github_org}/${var.github_repo}"]
}

data "aws_caller_identity" "current" {}
