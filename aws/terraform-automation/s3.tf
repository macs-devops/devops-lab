resource "aws_s3_bucket" "onebucket" {
  bucket = "gh-actions-automation"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name  = "gh-actions"
    Owner = "Max"
  }
}

