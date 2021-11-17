resource "google_project_iam_member" "cloud_build_sa_00_trigger" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/cloudbuild.builds.editor"
}