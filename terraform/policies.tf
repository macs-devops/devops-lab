resource "aws_iam_policy" "dynamo-policy" {
  name        = var.dynamodb_policy_name
  path        = "/"
  description = "tf dynamodb lock policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:PutItem",
        "dynamodb:GetItem",
        "dynamodb:DeleteItem",
        "dynamodb:DescribeTable"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:dynamodb:us-east-1:593043004533:table/terraform_state"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "dynamodb-attach" {
  role       = "github_role"
  policy_arn = aws_iam_policy.dynamo-policy.arn
}
