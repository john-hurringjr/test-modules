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
  Add Cloud Build to Org IAM (Not authoritative, that will be when we deploy)
 *****************************************/

resource "google_organization_iam_member" "org_admin" {
  depends_on  = [google_project_service.enable_build_api, google_project.project]
  member      = "serviceAccount:service-${google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  org_id      = var.org_id
  role        = "roles/resourcemanager.organizationAdmin"
}

resource "google_organization_iam_member" "access_context_manager_admin" {
  depends_on  = [google_project_service.enable_build_api, google_project.project]
  member      = "serviceAccount:service-${google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  org_id      = var.org_id
  role        = "roles/accesscontextmanager.policyAdmin"
}

resource "google_organization_iam_member" "folder_admin" {
  depends_on  = [google_project_service.enable_build_api, google_project.project]
  member      = "serviceAccount:service-${google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  org_id      = var.org_id
  role        = "roles/resourcemanager.folderAdmin"
}

resource "google_organization_iam_member" "org_policy_admin" {
  depends_on  = [google_project_service.enable_build_api, google_project.project]
  member      = "serviceAccount:service-${google_project.project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  org_id      = var.org_id
  role        = "roles/orgpolicy.policyAdmin"
}