variable "prox_user" {
  description = "The username for the Proxmox API (e.g., root@pam)" 
  type        = string
}

variable "prox_pass" {
  description = "The password for the Proxmox API" 
  type        = string
  sensitive   = true 
}

variable "s3_access_key" {
  description = "Access key for the S3/MinIO backend"
  type        = string
}

variable "s3_secret_key" {
  description = "Secret key for the S3/MinIO backend"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "The public SSH key string to be injected into the container"
  type        = string
}

variable "container_root_password" {
  description = "The root password for the created LXC container"
  type        = string
  sensitive   = true
}