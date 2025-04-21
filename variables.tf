variable "tfe_token" {
  description = "Terraform Cloud API Token"
  type        = string
  sensitive   = true
}

variable "tfe_organization" {
  description = "Terraform Cloud organization name"
  type        = string
}
