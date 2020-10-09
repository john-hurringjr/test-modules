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

data "google_iam_policy" "org_node_iam_policy_data" {

  audit_config {
    service = "allServices"

    audit_log_configs {
      log_type = "DATA_WRITE"
    }

    audit_log_configs {
      log_type = "ADMIN_READ"
    }

    audit_log_configs {
      log_type = "DATA_READ"
    }

  }

  binding {
    role    = "roles/resourcemanager.organizationAdmin"
    members = [
      "group:${var.organization_admins_group}", "serviceAccount:${var.terraform_service_account}"
    ]
  }

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
    role    = "roles/compute.securityAdmin"
    members = [
      "group:${var.security_admins_group}",
    ]
  }

  binding {
    role    = "roles/accesscontextmanager.policyAdmin"
    members = [
      "group:${var.security_admins_group}",
    ]
  }

  binding {
    role    = "roles/compute.osLoginExternalUser"
    members = [
      "group:${var.external_user_os_login_group}",
    ]
  }

  binding {
    role    = "roles/securitycenter.admin"
    members = [
      "group:${var.security_admins_group}",
    ]
  }

  binding {
    role    = "roles/accesscontextmanager.policyEditor"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role    = "roles/iam.organizationRoleAdmin"
    members = [
      "serviceAccount:${var.terraform_service_account}"
    ]
  }

  binding {
    role    = "roles/orgpolicy.policyAdmin"
    members = [
      "serviceAccount:${var.terraform_service_account}", "group:${var.security_admins_group}"
    ]
  }

  binding {
    role    = "roles/compute.xpnAdmin"
    members = [
      "group:${var.network_admins_group}", "serviceAccount:${var.terraform_service_account}" ,
    ]
  }

  binding {
    role    = "roles/logging.admin"
    members = ["serviceAccount:${var.terraform_service_account}"
    ]
  }

  binding {
    role    = "roles/iam.securityReviewer"
    members = ["group:${var.sre_group}",
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

  binding {
    role = "roles/iam.organizationRoleViewer"
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
  }

  binding {
    role = "roles/billing.creator"
    members = [
      "group:${var.billing_admins_group}",
    ]
  }

  binding {
    role = "roles/threatdetection.editor"
    members = [
      "serviceAccount:${var.terraform_service_account}", "group:${var.security_admins_group}"
    ]
  }

  binding {
    role    = "roles/cloudasset.viewer"
    members = [
      "group:${var.security_admins_group}",
    ]
  }

  #Below three permissions are required for Security Command Center to function properly (e.g. enable SHA)
  binding {
    role = "roles/securitycenter.serviceAgent"
    members = [
      "serviceAccount:service-org-${var.organization_id}@security-center-api.iam.gserviceaccount.com", ]
  }
  binding {
    role = "roles/serviceusage.serviceUsageAdmin"
    members = [
      "serviceAccount:service-org-${var.organization_id}@security-center-api.iam.gserviceaccount.com", ]
  }
  binding {
    role = "roles/cloudfunctions.serviceAgent"
    members = [
      "serviceAccount:service-org-${var.organization_id}@security-center-api.iam.gserviceaccount.com", ]
  }

}

/******************************************
  Org IAM Policy
 *****************************************/

resource "google_organization_iam_policy" "org_iam_policy" {
  org_id      = var.organization_id
  policy_data = data.google_iam_policy.org_node_iam_policy_data.policy_data
}