terraform {
  backend "s3" {
    bucket = "anilsclassmultiplews"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    tfe = {
      version = "~> 0.64.0"
    }
  }
}

provider "tfe" {
  token = var.tfe_token
}

variable "workspaces" {
  type    = list(string)
  default = ["sandbox", "dev", "test", "uat", "prod"]
}

resource "tfe_workspace" "test" {
  for_each     = toset(var.workspaces)
  name         = each.value
  organization = var.tfe_organization
}

resource "tfe_workspace_settings" "test-settings" {
  for_each       = tfe_workspace.test
  workspace_id   = each.value.id
  execution_mode = "local"
}
