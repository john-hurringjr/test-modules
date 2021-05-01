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
  Project Creation
 *****************************************/

resource "google_project" "project" {
  name            = var.project_friendly_name
  project_id      = "${var.unique_shared_id}-shrd-vpc-host-${var.environment}-${random_string.random_string.result}"
  folder_id       = var.folder_id
  billing_account = var.billing_account_id

  labels = {
    business_unit = var.label_business_unit
    restrictions  = var.label_restrictions
  }

}

/******************************************
  Promote Project to Shared VPC Host Project
 *****************************************/

resource "google_compute_shared_vpc_host_project" "promote_to_host" {
  depends_on  = [google_project_service.enable_compute_api]
  project     = google_project.project.project_id
}

/******************************************
  Rando String
 *****************************************/

resource "random_string" "random_string" {
  length    = 4
  lower     = true
  upper     = false
  special   = false
  number    = true
}