module "oidc_auth" {
  source = "github.com/moritzheiber/terraform-aws-oidc-github-actions-module?ref=v0.2.2"

  github_repositories = toset(["macs-devops/devops-lab"])
  role_names          = toset(["github_role"])
}

resource "aws_ssm_parameter" "hello" {
  name  = "hello_max-devops"
  type  = "String"
  value = "Hi from aws :wave:"
}
