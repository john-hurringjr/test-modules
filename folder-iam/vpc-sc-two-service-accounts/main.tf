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
  Policy Data
 *****************************************/

data "google_iam_policy" "folder_policy_data" {

  # Project Creation Permissions
  binding {
    members = [
      "serviceAccount:${var.terraform_project_creator_service_account}",
    ]
    role = "roles/compute.xpnAdmin"
  }

  binding {
    role = "roles/resourcemanager.projectCreator"
    members = [
      "serviceAccount:${var.terraform_project_creator_service_account}",
    ]
  }

  binding {
    role = "roles/resourcemanager.projectDeleter"
    members = [
      "serviceAccount:${var.terraform_project_creator_service_account}",
    ]
  }

  binding {
    role = "roles/resourcemanager.projectIamAdmin"
    members = [
      "serviceAccount:${var.terraform_project_creator_service_account}",
    ]
  }

  binding {
    role = "roles/billing.projectManager"
    members = [
      "serviceAccount:${var.terraform_project_creator_service_account}",
    ]
  }

  binding {
    role = "roles/resourcemanager.projectMover"
    members = [
      "serviceAccount:${var.terraform_project_creator_service_account}",
    ]
  }

  binding {
    role = "roles/serviceusage.serviceUsageAdmin"
    members = [
      "serviceAccount:${var.terraform_project_creator_service_account}",
    ]
  }

  # Resource Creation Permissions
  binding {
    role = "roles/compute.instanceAdmin.v1"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/iam.serviceAccountAdmin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/logging.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/monitoring.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/pubsub.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/storage.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/cloudfunctions.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/bigquery.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/compute.networkAdmin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/compute.securityAdmin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/dns.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/bigtable.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/cloudkms.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/cloudsql.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/cloudtrace.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/cloudtranslate.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/container.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/dataflow.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/dataproc.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/dlp.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/gkehub.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/iam.serviceAccountUser"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/secretmanager.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/spanner.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

  binding {
    role = "roles/ml.admin"
    members = [
      "serviceAccount:${var.terraform_resource_creator_service_account}",
    ]
  }

}

/******************************************
  Apply Shared Services IAM Policy
 *****************************************/

resource "google_folder_iam_policy" "folder_iam" {
  folder      = "folders/${var.folder_id}"
  policy_data = data.google_iam_policy.folder_policy_data.policy_data
}