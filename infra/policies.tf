resource "aws_iam_policy" "pin2022-ec2-policy" {
  name        = "pin2022-ec2-policy"
  description = "Policy github actions ec2"

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

resource "aws_iam_role_policy_attachment" "github-eks-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "terraform-github-action"
}
