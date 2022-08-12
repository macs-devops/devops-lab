provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "gh-bucket" {
  bucket = "gh-actions-automation"
  acl    = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.gh-bucket.id
    target_prefix = "log/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.gh-kms.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_kms_key" "gh-kms" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}
