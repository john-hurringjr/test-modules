
locals {
  roles_to_grant = toset(local.role_list)

  role_list = [
    "roles/cloudbuild.builds.editor",
    "roles/monitoring.admin",
    "roles/logging.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/storage.admin",
  ]
}

resource "google_project_iam_member" "iam_member" {
  for_each  = local.role_list
  member    = var.user_id
  role      = each.value
}