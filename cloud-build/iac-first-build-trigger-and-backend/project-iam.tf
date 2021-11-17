resource "google_project_iam_member" "cloud_build_sa_00_trigger" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/cloudbuild.builds.editor"
}

resource "google_storage_bucket_iam_member" "cloud_build_sa_00_trigger_gcs_backend" {
  bucket = google_storage_bucket.first_trigger_backend_state_bucket.id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/storage.admin"
}

resource "google_storage_bucket_iam_member" "cloud_build_sa_00_trigger_gcs_logs" {
  bucket = google_storage_bucket.cloud_build_logs_bucket.id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/storage.admin"
}