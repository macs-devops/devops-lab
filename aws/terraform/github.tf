data "http" "github_actions_openid_configuration" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}
data "tls_certificate" "github_actions" {
  url = jsondecode(data.http.github_actions_openid_configuration.body).jwks_uri
}
resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github_actions.certificates[0].sha1_fingerprint]
}

module "github_actions_role" {
  source               = "https://github.com/macs-devops/tf-aws-github-actions-oidc-role"
  role_name            = "github_role"
  repo_to_allow_assume = var.repo_to_allow_assume
  branches_to_allow_assume = [
    "main",
  ]
}

resource "aws_iam_role_policy" "github_role_policy" {
  name = "sample"
  role = module.github_actions_role.role.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "sts:GetCallerIdentity"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      }
    ]
  })
}
