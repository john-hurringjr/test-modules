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
  Project
 *****************************************/

resource "google_project" "project" {
  name            = var.project_friendly_name
  project_id      = "${var.unique_shared_id}-${var.environment}-${var.unique_project_identifier}"
  folder_id       = var.folder_id
  billing_account = var.billing_account_id

  labels = {
    business_unit = var.label_business_unit
    restrictions  = var.label_restrictions
  }

}

/******************************************
  Promote Project to Shared VPC Service Project
 *****************************************/

resource "google_compute_shared_vpc_service_project" "promote_service_project" {
  depends_on      = [google_project_service.enable_compute_api]
  host_project    = var.shared_vpc_host_project_id
  service_project = google_project.project.project_id
}