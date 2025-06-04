resource "proxmox_vm_qemu" "ubuntu_vm" {
  name        = "ubuntu-vm"
  target_node = "proxmox-node-name"
  clone       = "ubuntu-cloudinit-template"
  full_clone  = true

  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  memory      = 2048
  scsihw      = "virtio-scsi-pci"

  disk {
    slot     = 0
    size     = "10G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = true
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ciuser     = "ubuntu"
  sshkeys    = file("~/.ssh/id_rsa.pub")
  ipconfig0  = "ip=dhcp"

  agent      = 1
}
