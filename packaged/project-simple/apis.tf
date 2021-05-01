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

locals {
  activate_services = [
    "logging.googleapis.com",
    "accesscontextmanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "servicemanagement.googleapis.com",
    "storage-component.googleapis.com",
    "storage-api.googleapis.com",
    "cloudbilling.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudbuild.googleapis.com",
    "container.googleapis.com",
    "secretmanager.googleapis.com",
  ]
}
/******************************************
  APIs
 *****************************************/

resource "google_project_service" "enable_apis" {
  for_each            = local.activate_services
  project             = google_project.project.project_id
  service             = each.value
  disable_on_destroy  = false
}