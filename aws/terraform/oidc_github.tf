module "aws_oidc_github" {
  source = "git::https://github.com/macs-devops/terraform-aws-oidc-github"

  enabled = var.enabled

  attach_admin_policy           = var.attach_admin_policy
  attach_read_only_policy       = var.attach_read_only_policy
  create_oidc_provider          = var.create_oidc_provider
  force_detach_policies         = var.force_detach_policies
  github_thumbprint             = var.github_thumbprint
  iam_role_name                 = var.iam_role_name_github
  iam_role_path                 = var.iam_role_path
  iam_role_permissions_boundary = var.iam_role_permissions_boundary
  iam_role_policy_arns          = var.iam_role_policy_arns
  github_repositories           = var.github_repositories
  max_session_duration          = var.max_session_duration
  tags                          = var.tags

  iam_role_inline_policies = {
    "github_inline_policy" : data.aws_iam_policy_document.github.json
  }
}

data "aws_iam_policy_document" "github" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["*"]
  }
}
