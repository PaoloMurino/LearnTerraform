project = "test-pmurino-02"

vm = {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]
  image        = "debian-cloud/debian-11"
}

bucket = {
  name          = "pmurino-bucket-test"
  location      = "US"
  storage_class = "STANDARD" # Può essere STANDARD, NEARLINE, COLDLINE o ARCHIVE
}

sa = {
  account_id   = "custom-vm-sa"
  display_name = "Custom VM Service Account"
}