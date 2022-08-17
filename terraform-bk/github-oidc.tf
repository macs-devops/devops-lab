module "oidc-with-github-actions" {
  source  = "thetestlabs/oidc-with-github-actions/aws"
  version = "0.1.4"

  github_org = "macs-devops"
  github_repositories = [
    "devops-lab",
  ]
  iam_role_name        = "github-actions-role"
  iam_role_description = "Enable GitHub OIDC access"
  max_session_duration = 3600
  iam_role_policy      = "AdministratorAccess"
  iam_role_path        = "/security/"
}
