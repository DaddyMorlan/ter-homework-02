resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
resource "yandex_vpc_route_table" "rt" { #
  name       = "test-route-table"
  network_id = yandex_vpc_network.db.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}
resource "yandex_vpc_gateway" "nat_gateway" { #
  name = "test-gateway"
  shared_egress_gateway {}
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_name
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_names.web
  platform_id = var.vms_resources["web"].platform
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.vms_resources["web"].hdd_size
      type = var.vms_resources["web"].hdd_type
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources["web"].preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_metadata["common"].serial_port_enable
    ssh-keys           = var.vm_metadata["common"].ssh_keys
  }

}


resource "yandex_vpc_network" "db" {
  name = var.vpc_name_db
}

resource "yandex_vpc_subnet" "db" {
  name           = var.vpc_name_db
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.db.id
  v4_cidr_blocks = var.default_cidr_db
  route_table_id = yandex_vpc_route_table.rt.id #
}


resource "yandex_compute_instance" "db" {
  name        = local.vm_names.db
  platform_id = var.vms_resources["db"].platform
  zone = var.default_zone_b
  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.vms_resources["db"].hdd_size
      type = var.vms_resources["db"].hdd_type
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources["db"].preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
  }

  metadata = {
    serial-port-enable = var.vm_metadata["common"].serial_port_enable
    ssh-keys           = var.vm_metadata["common"].ssh_keys
  }

}
