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
  GCS Bucket
 *****************************************/

resource "google_storage_bucket" "sink_bucket" {
  project   = var.project_id
  location  = var.gcs_bucket_location
  name      = var.gcs_bucket_name

  bucket_policy_only = true


  retention_policy {
    is_locked         = var.gcs_bucket_lock_enabled
    retention_period  = var.gcs_bucket_retention_period
  }

  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
    condition {
      age = var.object_age_move_to_nearline
    }
  }


  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
    condition {
      age                   = var.object_age_move_to_coldline
      matches_storage_class = ["NEARLINE",]
    }
  }

}

/******************************************
  Org Log Sink
 *****************************************/

resource "google_logging_organization_sink" "org_log_sink" {
  destination       = "storage.googleapis.com/${google_storage_bucket.sink_bucket.id}"
  name              = var.sink_name
  org_id            = var.organization_id
  include_children  = true
  filter            = var.sink_filter
}

/******************************************
  GCS Bucket IAM
 *****************************************/

resource "google_storage_bucket_iam_member" "gcs_sink_writer_permission" {
  bucket  = google_storage_bucket.sink_bucket.name
  member  = google_logging_organization_sink.org_log_sink.writer_identity
  role    = "roles/storage.objectCreator"
}