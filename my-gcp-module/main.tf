provider "google" {
  project = "test-pmurino-02"
  region  = "us-central1"
}

module "gcp_infra" {
  source        = "./vm-module"
  
  project_id    = "test-pmurino-02"
  bucket_name   = "bucket-mio-terraform"
  instance_name = "mio-server"
  machine_type  = "e2-medium"
  zone          = "us-central1-a"
}
