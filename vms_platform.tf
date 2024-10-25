/*variable "instance_preferences" {
  type = map(object({        
        vm_web_platform = string
        vm_web_cores = number
        vm_web_memory = number
        vm_web_core_fraction = number
}))
        db = {
            platform      = "standard-v1"
            cores         = 2
            memory        = 2
            core_fraction = 20
            hdd_size = 11
            hdd_type = "network-hdd"
            preemptible     = true
        }
        web = {
            platform      = "standard-v1"
            cores         = 2
            memory        = 4
            core_fraction = 20
            hdd_size = 10
            hdd_type = "network-hdd"
            preemptible     = true
        }
    }
    */
variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_db" {
  type        = string
  default     = "db"
  description = "VPC network & subnet name"
}