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

resource "google_project_service" "enable_logging_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "logging.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_accesscontextmanager_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "accesscontextmanager.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_iam_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "iam.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_serviceusage_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "serviceusage.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_resourcemanager_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "cloudresourcemanager.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_servicemanagement_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "servicemanagement.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_storagecomponent_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "storage-component.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_storage_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "storage-api.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_billing_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "cloudbilling.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_budget_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "billingbudgets.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_build_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "cloudbuild.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_gke_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "container.googleapis.com"
  disable_on_destroy  = false
}
