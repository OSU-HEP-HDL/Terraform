# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox

terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = ">=2.9.3"
        }
        lxd = {
            source = "terraform-lxd/lxd"
        }
    }

    backend "remote" {
    hostname     = "app.terraform.io"
    organization = "OSU-HDL"

    workspaces {
      name = "Terraform-HDL"
    }
  }
}

variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
}

provider "proxmox" {

    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret

    # (Optional) Skip TLS Verification
    pm_tls_insecure = true

}

provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true
}
