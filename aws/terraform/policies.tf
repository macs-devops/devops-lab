resource "aws_iam_policy" "policy" {
  name        = "gh-actions-policy"
  path        = "/"
  description = "gh-actions-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attachment" {
  for_each   = module.oidc_auth.roles
  role       = each.key
  policy_arn = aws_iam_policy.policy.arn
}

data "aws_iam_policy_document" "github-actions-assume-role-trust-policy" {

  // Trust Policy
  statement {
    sid     = "GithubActionsAssumeRoleWithIdp"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::593043004533:oidc-provider/token.actions.githubusercontent.com"]
    }
    #condition {
    #  test     = "StringEquals"
    #  variable = "token.actions.githubusercontent.com:sub"
    #  values   = local.allowed_branches_to_assume_roles
    #}

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "github-actions-role-hello-attach" {
  role       = "github_role"
  policy_arn = aws_iam_policy.read-hello-parameter-policy.arn
}

resource "aws_iam_policy" "read-hello-parameter-policy" {
  name        = "max-devops-allow-read-hello-parameter-policy"
  description = "Allows to read ${aws_ssm_parameter.hello.name} parameter"

  policy = data.aws_iam_policy_document.read-hello-parameter-policy-document.json
}

data "aws_iam_policy_document" "read-hello-parameter-policy-document" {

  // Permission Policy
  // Allow to read ssm parameter hello
  statement {
    sid       = "AllowReadHello"
    actions   = ["ssm:GetParameters", "ssm:GetParameter"]
    resources = [aws_ssm_parameter.hello.arn]
  }
}
