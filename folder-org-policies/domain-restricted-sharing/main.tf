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
  Org Policies
  (Grant exceptions at lower level)
  Check link below for new policies available
  https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints
 *****************************************/

# May only add users to IAM from approved domains
resource "google_folder_organization_policy" "folder_org_policy_domain_restricted_sharing" {
  constraint  = "iam.allowedPolicyMemberDomains"
  folder      = var.folder_id
  inherit_from_parent = var.inherit_from_parent

  list_policy {
    allow {
      values = var.domain_identities
    }
  }

}
