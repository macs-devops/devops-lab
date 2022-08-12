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

  tags = {
    Name  = "gh-actions"
    Owner = "max-devops"
  }
}

resource "aws_kms_key" "gh-kms" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "gh-bucket-kms" {
  bucket = aws_s3_bucket.gh-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.gh-kms.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
