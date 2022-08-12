output "kms-arn" {
  description = "The kms key arn"
  value       = aws_kms_key.gh-kms.arn
}

#"aws_s3_bucket" "gh-bucket"
output "bucket-arn" {
  description = "The bucket arn"
  value       = aws_s3_bucket.gh-bucket.arn
}
