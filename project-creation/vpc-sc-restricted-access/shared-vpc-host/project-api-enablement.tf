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
  APIs
 *****************************************/

resource "google_project_service" "enable_compute_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "compute.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_logging_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "logging.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_oslogin_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "oslogin.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_dns_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "dns.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_service_networking_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "servicenetworking.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_gke_api" {
  depends_on          = [google_project.project, google_project_service.enable_compute_api]
  project             = google_project.project.project_id
  service             = "container.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_network_management_api" {
  depends_on          = [google_project.project, google_project_service.enable_compute_api]
  project             = google_project.project.project_id
  service             = "networkmanagement.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "firewall_insights_api" {
  depends_on          = [google_project.project, google_project_service.enable_compute_api]
  project             = google_project.project.project_id
  service             = "firewallinsights.googleapis.com"
  disable_on_destroy  = false
}
