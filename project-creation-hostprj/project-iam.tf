/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  New Default Service Account
  (Will mirror permissions of admin group)
 *****************************************/

resource "google_service_account" "new_project_default_service_account" {
  depends_on  = [google_project.project]
  project     = google_project.project.id
  account_id  = "default"
}

/******************************************
  Project IAM Bindings
 *****************************************/

resource "google_project_iam_binding" "logging_amin" {
  project = google_project.project.id
  role    = "roles/logging.admin"
  members = [
    "group:${var.network_admin_group_id}",
    "serviceAccount:${google_service_account.new_project_default_service_account.email}",
    "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "network_admin" {
  project = google_project.project.id
  role    = "roles/compute.networkAdmin"
  members = [
    "group:${var.network_admin_group_id}",
    "serviceAccount:${google_service_account.new_project_default_service_account.email}",
    "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "compute_security_admin" {
  project = google_project.project.id
  role    = "roles/compute.securityAdmin"
  members = [
    "group:${var.security_admin_group_id}",
    "serviceAccount:${google_service_account.new_project_default_service_account.email}",
    "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "service_account_user" {
  project = google_project.project.id
  role    = "roles/iam.serviceAccountUser"
  members = [
    "group:${var.network_admin_group_id}",
    "serviceAccount:${google_service_account.new_project_default_service_account.email}",
    "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "compute_instance_admin" {
  project = google_project.project.id
  role    = "roles/compute.instanceAdmin.v1"
  members = [
    "group:${var.network_admin_group_id}",
    "serviceAccount:${google_service_account.new_project_default_service_account.email}",
    "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
  ]
}


resource "google_project_iam_binding" "editor_remove" {
  project = google_project.project.id
  members = []
  role = "roles/editor"
}