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

  binding {
    role    = "roles/resourcemanager.organizationAdmin"
    members = [
      "group:${var.organization_admins_group}", "serviceAccount:${var.terraform_service_account}"
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
    role = "roles/serviceusage.serviceUsageViewer"
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
    role = "roles/billing.admin"
    members = [
      "serviceAccount:${var.billing_admins_group}",
    ]
  }

//  binding {
//    role = "roles/organizationViewer"
//    members = [
//      "domain:${var.domain_identity_primary}",
//    ]
//  }


}

/******************************************
  Org IAM Policy
 *****************************************/

resource "google_organization_iam_policy" "org_iam_policy" {
  org_id      = var.organization_id
  policy_data = data.google_iam_policy.org_node_iam_policy_data.policy_data
}