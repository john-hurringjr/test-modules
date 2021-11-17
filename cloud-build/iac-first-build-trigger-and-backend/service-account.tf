resource "google_service_account" "sa_00_trigger" {
  account_id  = "00-trigger"
  project     = var.project_id
}