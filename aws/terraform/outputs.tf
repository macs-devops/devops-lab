output "role-arn" {
  description = "The role ARN"
  value       = aws_iam_role.default.arn
}

#aws_kms_key
output "kms-arn" {
  description = "The kms key arn"
  value       = aws_kms_key.this.arn
}
