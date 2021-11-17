/******************************************
  Bucket to store all tf state files
 *****************************************/
resource "google_storage_bucket" "backend_state_bucket" {
  project   = var.project_id
  name      = "terraform-backends-${random_string.random_string.result}"
  location  = var.gcs_terraform_backend_bucket_location
  storage_class = "MULTI_REGIONAL"
  versioning {
    enabled = true
  }
}


resource "google_storage_bucket_object" "backend_folders" {
  for_each = local.folder_list
  bucket = google_storage_bucket.backend_state_bucket.name
  name   = "${each.value}/"
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