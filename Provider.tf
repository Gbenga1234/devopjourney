terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://your-proxmox-host:8006/api2/json"
  pm_api_token_id = "your-user@pve!your-token-id"
  pm_api_token_secret = "your-token-secret"
  pm_tls_insecure = true
}
