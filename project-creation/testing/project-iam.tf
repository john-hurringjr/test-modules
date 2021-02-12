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
  depends_on  = [google_project.project, google_project_service.enable_compute_api,]
  project     = google_project.project.project_id
  account_id  = "default"
}

/******************************************
  IAM Policy Data
 *****************************************/

data "google_iam_policy" "project_iam_policy_data" {

  # Project Admins & Appropriate Service Accounts

  binding {
    role = "roles/bigquery.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/bigtable.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/binaryauthorization.attestorsAdmin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/binaryauthorization.policyAdmin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/binaryauthorization.serviceAgent"
    members = [
      "serviceAccount:service-${google_project.project.number}@gcp-sa-binaryauthorization.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudbuild.builds.editor"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudbuild.builds.builder"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_project.project.number}@cloudbuild.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudbuild.serviceAgent"
    members = [
      "serviceAccount:service-${google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudfunctions.admin"
    members = [
      "group:${var.project_admin_group_id}",
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
    role = "roles/cloudkms.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudscheduler.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudsql.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/cloudtrace.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/composer.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/compute.instanceAdmin.v1"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/compute.serviceAgent"
    members = [
      "serviceAccount:service-${google_project.project.number}@compute-system.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/container.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/container.serviceAgent"
    members = [
      "serviceAccount:service-${google_project.project.number}@container-engine-robot.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/dataflow.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/dataflow.serviceAgent"
    members = [
      "serviceAccount:service-${google_project.project.number}@dataflow-service-producer-prod.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/dataproc.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/dlp.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/gkehub.admin"
    members = [
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/iam.serviceAccountAdmin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/iam.serviceAccountUser"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

    binding {
      role = "iap.tunnelResourceAccessor"
      members = [
        "group:${var.project_admin_group_id}",
      ]
    }

  binding {
    role = "roles/logging.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/monitoring.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/pubsub.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/secretmanager.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/spanner.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/storage.admin"
    members = [
      "group:${var.project_admin_group_id}",
      "serviceAccount:${google_service_account.new_project_default_service_account.email}",
      "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com",
    ]
  }

}

/******************************************
  IAM Policy Applied to Project
 *****************************************/

resource "google_project_iam_policy" "project_iam_policy" {
  depends_on  = [google_project.project, google_project_service.enable_compute_api, google_service_account.new_project_default_service_account, google_project_service.enable_gke_api, google_project_service.enable_binaryauthorization_api]
  policy_data = data.google_iam_policy.project_iam_policy_data.policy_data
  project     = google_project.project.project_id
}
