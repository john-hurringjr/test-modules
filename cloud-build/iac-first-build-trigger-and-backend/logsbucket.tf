/******************************************
  Bucket to store all tf state files
 *****************************************/
resource "google_storage_bucket" "cloud_build_logs_bucket" {
  project   = var.project_id
  name      = "cloud-build-logs-${random_string.build_logs_random_string.result}"
  location  = var.gcs_terraform_backend_bucket_location
  storage_class = "MULTI_REGIONAL"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

}

/******************************************
  Random String
 *****************************************/
resource "random_string" "build_logs_random_string" {
  length    = 35
  lower     = true
  upper     = false
  special   = false
  number    = true
}