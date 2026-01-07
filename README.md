# Proxmox LXC Automation with Terraform

This repository provides a Terraform configuration to automate the deployment of a Debian 12 LXC container on a Proxmox Virtual Environment. It uses a remote S3-compatible backend (MinIO) for secure state management.

## 🛠 Project Structure

* **`main.tf`**: Defines the Proxmox provider, the S3 backend, and the `proxmox_virtual_environment_container` resource.
* **`variables.tf`**: Declares the necessary variables for credentials and configuration to avoid hardcoding secrets.
* **`terraform.tfvars`**: (Local Only) Contains your private values. 

## 🔐 Credentials Configuration

To use this project, create a `terraform.tfvars` file locally and define the following variables:

### Proxmox Access
* **`prox_user`**: Your Proxmox API username (e.g., `root@pam`).
* **`prox_pass`**: Your Proxmox API password.
* **`endpoint`**: The IP of your Proxmox server (e.g, `https://192.168.20.9:8006`).

### Backend (S3/MinIO)
* **`s3_access_key`**: Your MinIO access key.
* **`s3_secret_key`**: Your MinIO secret key.
* **`endpoints`**: The local S3 endpoint (e.g, `http://localhost:8888`).

### Container Setup
* **`ssh_public_key`**: The public key string used for SSH access to the container.
* **`container_root_password`**: The password assigned to the container's root user.

## 🚀 Deployment

1. **Initialize**: `terraform init` (Sets up the Proxmox provider and S3 backend).
2. **Plan**: `terraform plan` (Review the 1 CPU, 256MB RAM, 3GB Disk resource).
3. **Apply**: `terraform apply` (Deploys the container to node `fanida`).
