variable "github_org" {
  type        = string
  description = "GitHub organization to scope access"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository to scope access"
}

variable "github_custom_claim" {
  type        = string
  default     = "ref:refs/heads/main"
  description = "GitHub custom OIDC claim to scope access"
}

variable "dynamodb_policy_name" {
  type        = string
  description = "Policy permission dynamodb"
}

variable "WS_ACCESS_KEY_ID" {
  type        = string
  description = "github secret WS_ACCESS_KEY_ID"
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "github secret AWS_SECRET_ACCESS_KEY"
  sensitive   = true
}
