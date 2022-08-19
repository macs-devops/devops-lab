variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
  type        = string
}

variable "bootstrap_enabled" {
  description = "Whether to enable permissions to create the bootstrap S3 bucket and Dynamo Table"
  type        = bool
  default     = true
}

variable "github_org" {
  description = "GitHub org for the repo with the action that will use this IAM role"
  default     = "macs-devops"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo with the action that will use this IAM role"
  default     = "devops-lab"
  type        = string
}

variable "namespace" {
  description = "Namespace qualifier to use for role and policy resources"
  default     = "terraform"
  type        = string
}

variable "tag_condition" {
  description = "Key-value tag condition to add to IAM policies where possible"
  type        = object({ key = string, value = string })
  default     = { key = "owner", value = "max" }
}

variable "availabilityZone" {
  default = "us-east-1a"
}

variable "instanceTenancy" {
  default = "default"
}

variable "dnsSupport" {
  default = false
}

variable "dnsHostNames" {
  default = false
}

variable "vpcCIDRblock" {
  default = "10.0.0.0/16"
}

variable "subnetCIDRblock" {
  default = "10.0.1.0/24"
}

variable "destinationCIDRblock" {
  default = "0.0.0.0/0"
}

variable "ingressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "egressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "mapPublicIP" {
  default = true
}

variable "bootstrap_enabled" {
  description = "Whether to enable permissions to create the bootstrap S3 bucket and Dynamo Table"
  type        = bool
  default     = true
}

variable "github_org" {
  description = "GitHub org for the repo with the action that will use this IAM role"
  default     = "macs-devops"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo with the action that will use this IAM role"
  default     = "devops-lab"
  type        = string
}

variable "namespace" {
  description = "Namespace qualifier to use for role and policy resources"
  default     = "terraform"
  type        = string
}

variable "tag_condition" {
  description = "Key-value tag condition to add to IAM policies where possible"
  type        = object({ key = string, value = string })
  default     = { key = "owner", value = "max" }
}

