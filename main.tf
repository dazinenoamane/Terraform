provider "proxmox" {
  endpoint = "https://100.124.46.9:8006" 
  username = var.prox_user 
  password = var.prox_pass 
  insecure = true 
}

terraform {
    backend "s3" {
        bucket = "vm1" 
        key    = "terraform.tfstate" 
        region = "main" 
        endpoints = {
            s3 = "http://localhost:8888" 
        } 
        access_key = var.s3_access_key # Sanitized
        secret_key = var.s3_secret_key # Sanitized
        
        skip_credentials_validation = true 
        skip_metadata_api_check     = true 
        skip_region_validation      = true 
        force_path_style            = true 
        skip_requesting_account_id  = true 
    }
}

resource "proxmox_virtual_environment_container" "vmNoamane" {
  node_name = "fanida" 
  vm_id     = 1001 

  initialization {
    hostname = "vmNoamane" 

    user_account {
      keys     = [var.ssh_public_key] # Sanitized
      password = var.container_root_password # Sanitized
    }

   ip_config {
      ipv4 {
        address = "dhcp" 
      }
    }
  }

  cpu {
    cores = 1 
  }

  memory {
    dedicated = 256 
  }

  network_interface {
    name   = "eth0" [cite: 4]
    bridge = "vmbr1" [cite: 4]
  }

  operating_system {
    template_file_id = "local:vztmpl/debian-12-standard_12.12-1_amd64.tar.zst" [cite: 4]
    type             = "debian" [cite: 4]
  }

  disk {
    datastore_id = "local-lvm" [cite: 4]
    size         = 3 [cite: 4]
  }
}