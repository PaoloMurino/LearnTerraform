variable "project_id" {
  type = string
}

variable "bucket_name" {
  description = "Nome del Bucket da creare"
  type = string

  validation {
    condition = substr(var.bucket_name, 0, 6) == "bucket"
    error_message = "Il nome del bucket deve iniziare con \"bucket\""
  }
}

variable "bucket_location" {
  type    = string
  default = "US"
}

variable "instance_name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}
