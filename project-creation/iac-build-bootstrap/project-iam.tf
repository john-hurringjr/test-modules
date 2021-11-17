
locals {
  roles_to_grant = toset(local.role_list)

  role_list = [
    "roles/cloudbuild.builds.editor",
    "roles/monitoring.admin",
    "roles/logging.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/storage.admin",
    "roles/resourcemanager.projectIamAdmin"
  ]
}

resource "google_project_iam_member" "iam_member" {
  for_each  = local.roles_to_grant
  project = google_project.project.project_id
  member    = "user:${var.user_id}"
  role      = each.value
}