output "bucket_name" {
  value = google_storage_bucket.bucket.name
}

output "vm_instance_id" {
  value = google_compute_instance.vm.id
}

output "service_account_email" {
  value = google_service_account.vm_sa.email
}
