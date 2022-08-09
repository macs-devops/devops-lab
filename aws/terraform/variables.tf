variable "region" {
  description = "Target region"
  default     = "us-east-1"
}

variable "profile" {
  description = "The profile you want to use"
}

variable "github_organizations" {
  description = "Github organizations to allow assume role for"
  default     = "macs-devops"

}

variable "repo_to_allow_assume" {
  description = "Repo to allow assume role for github actions"
  default     = "macs-devops/devops-lab"
}
