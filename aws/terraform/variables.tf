variable "region" {
  description = "Target region"
  default     = "us-east-1"
}

variable "profile" {
  description = "The profile you want to use"
}

variable "attach_admin_policy" {
  default     = false
  description = "Flag to enable/disable the attachment of the AdministratorAccess policy."
  type        = bool
}

variable "attach_read_only_policy" {
  default     = true
  description = "Flag to enable/disable the attachment of the ReadOnly policy."
  type        = bool
}

variable "enabled" {
  default     = true
  description = "Flag to enable/disable the creation of resources."
  type        = bool
}

variable "github_thumbprint" {
  default     = "15e29108718111e59b3dad31954647e3c344a231"
  description = "GitHub OpenID TLS certificate thumbprint."
  type        = string
}

variable "github_role" {
  default = "github_role"
  type    = string
}
