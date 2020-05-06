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

resource "google_project_service" "enable_pubsub_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "pubsub.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_bigquery_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "bigquery.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_logging_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "logging.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "enable_storage_component_api" {
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

resource "google_project_service" "enable_storage_transfer_api" {
  depends_on          = [google_project.project]
  project             = google_project.project.project_id
  service             = "storagetransfer.googleapis.com"
  disable_on_destroy  = false
}