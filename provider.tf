# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox

terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
          # source  = "telmate/proxmox"
          # switching to forked version for now, as the original is not maintained anymore and has some issues
          # ... tbd
          source  = "Terraform-for-Proxmox/proxmox"
          version = ">= 0.0.1"
        }
        # we aren't using LXD
        # lxd = {
        #     source = "terraform-lxd/lxd"
        # }
    }
    cloud { 
    
    organization = "OSU-HDL" 

    workspaces { 
      name = "HDL-Cluster" 
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

variable "PUBLIC_SSH_KEY" {
  description = "The public SSH key to be used for the VM"
  type = string
  sensitive = true
}

provider "proxmox" {
pm_api_url = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

# provider "lxd" {
#   generate_client_certificates = true
#   accept_remote_certificate    = true
# }
