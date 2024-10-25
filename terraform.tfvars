vms_resources = {
    db = {
      platform      = "standard-v1"
      cores         = 2
      memory        = 2
      core_fraction = 20
      hdd_size      = 11
      hdd_type      = "network-hdd"
      preemptible   = true
    }
    web = {
      platform      = "standard-v1"
      cores         = 2
      memory        = 4
      core_fraction = 20
      hdd_size      = 10
      hdd_type      = "network-hdd"
      preemptible   = true
    }
  }
vm_metadata = {
    common = {
        serial_port_enable = 1
        ssh_keys     = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqn/KaCuYfnVz9hlIZCAzurx2v06PDLXKWX1/pHuEg8 root@user-MacBookAir4-1"
    }
}

test = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]