variable "region" {
  description = "Target region"
  default     = "us-east-1"
}

variable "profile" {
  description = "The profile you want to use"
}

variable "aws_root_name" {
  type        = string
  description = "Root name prefix to use in resource name tags"
}

variable "aws_environment_name" {
  type        = string
  description = "Environment name to use in resource name tags"
}

variable "aws_source_name" {
  type        = string
  description = "Source name of the tool that constructed the resource to use in resource name tags"
}

variable "aws_kms_admin" {
  type        = string
  description = "Key Administrator"
}

variable "aws_kms_user" {
  type        = string
  description = "Key User"
}
