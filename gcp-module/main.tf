provider "google" {
  project = var.project_id
  region  = var.default_region
}

locals {
  regions = toset([for vm in values(var.vm_configs) : vm.region])
}

module "instance_template" {
  for_each = local.regions

  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "13.2.4"

  project_id   = var.project_id
  region       = each.key
  name_prefix  = "vm-template-${each.key}"
  machine_type = "e2-medium"

  subnetwork         = var.subnetwork
  subnetwork_project = var.project_id
  service_account    = var.service_account
}

module "compute_instance" {
  for_each = var.vm_configs

  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "13.2.4"

  region              = each.value.region
  zone                = each.value.zone
  subnetwork          = each.value.subnetwork
  subnetwork_project  = var.project_id
  hostname            = each.key
  instance_template   = module.instance_template[each.value.region].self_link
  deletion_protection = false

  access_config = [{
    nat_ip       = var.nat_ip
    network_tier = var.network_tier
  }]
}
