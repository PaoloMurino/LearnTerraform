provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = var.vpc
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm.name
  machine_type = var.vm.machine_type
  tags         = var.vm.tags

  boot_disk {
    initialize_params {
      image = var.vm.image
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket.name
  location      = var.bucket.location
  storage_class = var.bucket.storage_class
  project       = var.project

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}


resource "google_service_account" "vm_sa" {
  account_id   = var.sa.account_id
  display_name = var.sa.display_name
}

resource "google_project_iam_member" "bucket_access" {
  project = var.project
  role    = var.sa.role
  member  = "serviceAccount:${google_service_account.vm_sa.email}"
}


resource "google_compute_firewall" "ssh-rule" {
  name    = var.firewall_rule
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}