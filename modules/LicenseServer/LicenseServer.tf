# # Proxmox Full-Clone
# # ---
# # Create a new VM from a clone
terraform {
    required_providers {
        proxmox = {
            # source  = "telmate/proxmox"
            # switching to forked version for now, as the original is not maintained anymore and has some issues
            # ... tbd
            source  = "Terraform-for-Proxmox/proxmox"
            version = ">= 0.0.1"
        }
    }
}

variable "LIC_PUBLIC_SSH_KEY" {
  description = "The public SSH key to be used for the VM"
  type = string
  sensitive = true
}

resource "proxmox_vm_qemu" "LicenseServer" {
    
    # VM General Settings
    target_node = "VM01"
    vmid = "403"
    name = "LicenseServer"
    desc = "Ubuntu Server that acts as a License Server"
    qemu_os = "l26"
    bios = "seabios"
    tags = "Linux, Ubuntu, LicenseServer"

    # VM Advanced General Settings
    onboot = true
    startup = ""
    automatic_reboot = false  # refuse auto-reboot when changing a setting


    # VM OS Settings
    

    full_clone = true
    clone = "pkr-ubuntu-noble-1"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 4
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 16384

    # VM IP Address Settings
    ipconfig0 = "ip=10.221.194.50/24,gw=10.221.194.254"
    
    

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    scsihw = "virtio-scsi-pci"  # default virtio-scsi-pci

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    ciuser = "admin"
    
    # (Optional) Add your SSH KEY
    sshkeys = var.LIC_PUBLIC_SSH_KEY
}