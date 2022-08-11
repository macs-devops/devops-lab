#aws_kms_key
output "kms-arn" {
  description = "The kms key arn"
  value       = aws_kms_key.this.arn
}
