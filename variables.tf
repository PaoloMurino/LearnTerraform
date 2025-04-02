variable "project" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "vpc" {
  description = "vpc network"
  type        = string
  default     = "terraform-network"
}

variable "vm" {
  description = "vm configuration"
  type = object({
    name         = string
    machine_type = string
    tags         = list(string)
    image        = string
  })
}

variable "bucket" {
  description = "bucket configuration"
  type = object({
    name          = string
    location      = string
    storage_class = string
  })
}

variable "sa" {
  description = "sa configuration"
  type = object({
    account_id   = string
    display_name = string
    role         = string
  })
}

variable "firewall_rule" {
  default = "ssh"
}