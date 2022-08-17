module "github_oidc_role" {
  source = "../gh-oidc"

  aws_region    = var.aws_region
  github_org    = var.github_org
  github_repo   = var.github_repo
  namespace     = var.namespace
  tag_condition = var.tag_condition
}
