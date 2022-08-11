resource "aws_s3_bucket" "onebucket" {
  bucket = "gh-actions-automation"
  acl    = "private"
  region = "us-east-1"

  versioning {
    enabled = true
  }

  tags = {
    Name  = "gh-actions"
    Owner = "Max"
  }
}

