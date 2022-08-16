resource "aws_s3_bucket" "bucket" {
  bucket = "tf-state-max-devops"
  versioning {
    enabled = true
  }

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
