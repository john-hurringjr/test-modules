/******************************************
  Bucket to store all tf state files
 *****************************************/
resource "google_storage_bucket" "first_trigger_backend_state_bucket" {
  project   = var.project_id
  name      = "terraform-backend-first-trigger-${random_string.random_string.result}"
  location  = var.gcs_terraform_backend_bucket_location
  storage_class = "MULTI_REGIONAL"
  versioning {
    enabled = true
  }
}

/******************************************
  Random String
 *****************************************/
resource "random_string" "random_string" {
  length    = 30
  lower     = true
  upper     = false
  special   = false
  number    = true
}