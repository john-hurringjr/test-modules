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
 *****************************************/

resource "google_service_account" "new_project_default_service_account" {
  depends_on  = [google_project.project]
  project     = google_project.project.project_id
  account_id  = "default"
}

/******************************************
  IAM Policy Data
 *****************************************/

data "google_iam_policy" "project_iam_policy_data" {

  # Project Admins & Appropriate Service Accounts

  binding {
    role = "roles/viewer"
    members = [
      "group:${var.project_viewer_group}",
    ]
  }

  binding {
    role = "roles/cloudfunctions.admin"
    members = [
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudfunctions.serviceAgent"
    members = [
      "serviceAccount:service-${google_project.project.number}@gcf-admin-robot.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/iam.serviceAccountAdmin"
    members = [
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/iam.serviceAccountUser"
    members = [
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/logging.admin"
    members = [
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/monitoring.admin"
    members = [
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/pubsub.admin"
    members = [
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/storage.admin"
    members = [
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

}

/******************************************
  IAM Policy Applied to Project
 *****************************************/

resource "google_project_iam_policy" "project_iam_policy" {
  depends_on  = [google_project.project, google_service_account.new_project_default_service_account]
  policy_data = data.google_iam_policy.project_iam_policy_data.policy_data
  project     = google_project.project.project_id
}
