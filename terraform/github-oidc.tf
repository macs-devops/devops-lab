module "github-actions-oidc" {
  source  = "hectcastro/github-actions-oidc/aws"
  version = "0.1.0"

  github_org          = "macs-devops"
  github_repo         = "devops-lab"
  github_custom_claim = "ref:refs/heads/main" # insert the 2 required variables here
}
