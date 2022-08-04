output "s3_backend_bucket_name" {
  value = module.backend.s3_backend_bucket_name
}

output "dynamodb_lock_table_name" {
  value = module.backend.dynamodb_lock_table_name
}

output "dynamodb_lock_table_arn" {
  value = module.backend.dynamodb_lock_table_arn
}

output "dynamodb_lock_stream_arn" {
  value = module.backend.dynamodb_lock_stream_arn
}

output "dynamodb_lock_stream_label" {
  value = module.backend.dynamodb_lock_stream_label
}

output "iam_role_arn_github" {
  description = "ARN of the IAM role."
  value       = module.aws_oidc_github.iam_role_arn
}
