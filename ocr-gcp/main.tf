provider "google" {
  project = var.providerDefault.project
  region  = var.providerDefault.region
  zone    = var.providerDefault.zone
}

resource "google_storage_bucket" "bucket" {
  for_each = var.buckets

  name     = each.value.name
  location = each.value.location
  force_destroy = true
}

resource "google_pubsub_topic" "topics" {
  for_each = toset(var.pubsub_topics)
  name     = each.value
}
