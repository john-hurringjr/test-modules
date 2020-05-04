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

/**
  To be updated with new subnets created in corresponding subnet creation section
**/

/******************************************
  Subnet 1 Network User IAM Members
 *****************************************/
resource "google_compute_subnetwork_iam_member" "iam_member_subnet_1_cloudserv" {
  project     = google_project.project.project_id
  region      = var.subnet_1_region
  role        = "roles/compute.networkUser"
  member      = "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com"
  subnetwork  = var.subnet_1_name
}

resource "google_compute_subnetwork_iam_member" "iam_member_subnet_1_new_default" {
  project     = google_project.project.project_id
  region      = var.subnet_1_region
  role        = "roles/compute.networkUser"
  member      = "serviceAccount:${google_service_account.new_project_default_service_account.email}"
  subnetwork  = var.subnet_1_name
}

/******************************************
  Subnet 2 Network User IAM Members
 *****************************************/
resource "google_compute_subnetwork_iam_member" "iam_member_subnet_2_cloudserv" {
  project     = google_project.project.project_id
  region      = var.subnet_2_region
  role        = "roles/compute.networkUser"
  member      = "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com"
  subnetwork  = var.subnet_2_name
}

resource "google_compute_subnetwork_iam_member" "iam_member_subnet_2_new_default" {
  project     = google_project.project.project_id
  region      = var.subnet_2_region
  role        = "roles/compute.networkUser"
  member      = "serviceAccount:${google_service_account.new_project_default_service_account.email}"
  subnetwork  = var.subnet_2_name
}