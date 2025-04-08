variable "project_id" {
  description = "The GCP project to use for integration tests"
  type        = string
  default     = "test-pmurino-02"
}

variable "default_region" {
  description = "The GCP region to create and test resources in"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone to create resources in"
  type        = string
  default     = null
}

variable "subnetwork" {
  description = "The subnetwork selflink to host the compute instances in"
  default     = "https://www.googleapis.com/compute/v1/projects/test-pmurino-02/regions/us-central1/subnetworks/default"
}

variable "nat_ip" {
  description = "Public ip address"
  default     = null
}

variable "network_tier" {
  description = "Network network_tier"
  default     = "PREMIUM"
}

variable "service_account" {
  default = null
  type = object({
    email  = string,
    scopes = set(string)
  })
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template#service_account."
}

variable "vm_configs" {
  description = "VMs configurations"
  type = map(object({
    machine_type = string
    region       = string
    zone         = string
    subnetwork   = string
  }))
}
