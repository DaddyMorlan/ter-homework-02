###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh varsы

variable "vm_metadata" {
  type = map(object({
    serial_port_enable = number
    ssh_keys = string
  }))
  
}

variable "image_name" {
  type = string
  default = "ubuntu-2204-lts"
}
/*
variable "instance_preferences" {
  type = object({
    vm_web_name = string
    vm_web_platform = string
    vm_web_cores = number
    vm_web_memory = number
    vm_web_core_fraction = number
  })
  default = {
    vm_web_name = "netology-develop-platform-web"
    vm_web_platform = "standard-v1"
    vm_web_cores = 2
    vm_web_memory = 2
    vm_web_core_fraction = 20
  }
}*/

variable "vms_resources" {
  type = map(object({
    platform      = string
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
    preemptible   = bool
  }))
}
variable "test" {
  type = list(
    map(
      list(string)
    )
  )
}