# # Proxmox Full-Clone
# # ---
# # Create a new VM from a clone


terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = ">=2.9.3"
        }
    }
}

resource "proxmox_vm_qemu" "docker" {
    
    # VM General Settings
    target_node = "vm01"
    # vmid = "404"
    name = "docker"
    desc = "Ubuntu Server that acts as a Network Video Recorder"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "UbuntuTemplate"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 4
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 16384

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    # ciuser = "your-username"
    
    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF
}