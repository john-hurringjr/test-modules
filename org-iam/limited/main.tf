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
      "group:${var.group_break_glass}", "serviceAccount:${var.terraform_org_service_account}"
    ]
  }

  binding {
    role    = "roles/accesscontextmanager.policyAdmin"
    members = [
      "serviceAccount:${var.terraform_org_service_account}",
    ]
  }

  #typically wouldn't be used/required, but my ID is not from this org...
  binding {
    role    = "roles/compute.osLoginExternalUser"
    members = [
      "group:${var.external_user_os_login_group}",
    ]
  }

  binding {
    role    = "roles/securitycenter.adminViewer"
    members = [
      "group:${var.security_admins_group}",
    ]
  }

  binding {
    role    = "roles/iam.organizationRoleAdmin"
    members = [
      "serviceAccount:${var.terraform_org_service_account}",
    ]
  }

  binding {
    role    = "roles/orgpolicy.policyAdmin"
    members = [
      "serviceAccount:${var.terraform_org_service_account}",
    ]
  }

  binding {
    role    = "roles/compute.xpnAdmin"
    members = [
      "serviceAccount:${var.terraform_org_service_account}" ,
    ]
  }

  binding {
    role    = "roles/logging.admin"
    members = ["serviceAccount:${var.terraform_org_service_account}"
    ]
  }

  binding {
    role    = "roles/iam.securityReviewer"
    members = ["group:${var.security_admins_group}",
    ]
  }

  binding {
    role = "roles/resourcemanager.folderAdmin"
    members = [
      "serviceAccount:${var.terraform_org_service_account}",
    ]
  }

  binding {
    role = "roles/resourcemanager.tagAdmin"
    members = [
      "serviceAccount:${var.terraform_org_service_account}",
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
      "serviceAccount:${var.terraform_org_service_account}",
    ]
  }

  #Required for CSCC to function properly (e.g. enable SHA)
  binding {
    role = "roles/securitycenter.serviceAgent"
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