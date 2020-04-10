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

data "google_iam_policy" "folder_iam_policy_data" {

  binding {
    role    = "roles/iam.serviceAccountCreator"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role    = "roles/iam.serviceAccountDeleter"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role    = "roles/compute.xpnAdmin"
    members = [
      "serviceAccount:${var.terraform_service_account}" ,
    ]
  }

  binding {
    role    = "roles/logging.admin"
    members = ["serviceAccount:${var.terraform_service_account}"
    ]
  }

  binding {
    role = "roles/resourcemanager.folderAdmin"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role = "roles/resourcemanager.projectCreator"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role = "roles/resourcemanager.projectDeleter"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role = "roles/resourcemanager.projectIamAdmin"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role = "roles/billing.projectManager"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role = "roles/resourcemanager.projectMover"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role = "roles/serviceusage.serviceUsageAdmin"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

}

/******************************************
  Org IAM Policy
 *****************************************/

resource "google_folder_iam_policy" "folder_iam_policy" {
  policy_data = data.google_iam_policy.folder_iam_policy_data.policy_data
  folder = var.folder_id
}