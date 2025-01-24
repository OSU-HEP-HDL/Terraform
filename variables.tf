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