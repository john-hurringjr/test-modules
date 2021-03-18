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
  Project IAM
 *****************************************/

resource "google_project_iam_member" "project_admin_group_prj" {
  project = google_project.project.project_id
  member  = "group:${var.project_admin_group_id}"
  role    = "roles/owner"
}

/******************************************
  Shared VPC Host Project Network User IAM
 *****************************************/

resource "google_project_iam_member" "cloud_services" {
  project = var.shared_vpc_host_project_id
  member  = "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com"
  role    = "roles/compute.networkUser"
}

resource "google_project_iam_member" "project_admin_group_host" {
  project = var.shared_vpc_host_project_id
  member  = "group:${var.project_admin_group_id}"
  role    = "roles/compute.networkUser"
}
