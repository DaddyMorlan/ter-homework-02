locals {
  project_name  = "netology-develop"
  env   = "platform"

  vm_names = {
    web = "${local.project_name}-${local.env}-web"
    db      = "${local.project_name}-${local.env}-db"
  }
}