resource "aws_iam_policy" "pin2022-ec2-policy" {
  name        = "test-policy"
  description = "A test policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "ec2:*",
            "Resource": "*",
            "Effect": "Allow",
            "Condition": {
                "StringEquals": {
                    "ec2:Region": "us-east-1"
                }
            }
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "terraform-github-action"
  policy_arn = aws_iam_policy.pin2022-ec2-policy.arn
}
