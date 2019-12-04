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
  Varables
 *****************************************/

variable "project_id" {
  type        = string
  description = "Project ID which will host the gcs bucket for org sink"
}

variable "gcs_bucket_lock_enabled" {
  type        = bool
  description = "If enabled will not allow deletion of objects until their age reaches defined retention period. Default is false. WARNING: Locking a bucket is an irreversible action."
  default     = false
}

variable "gcs_bucket_retention_period" {
  type        = number
  description = "Duration, in seconds, that an object in bucket must be retained, and cannot be deleted, overwritten, or archived. The value must be less than 3,155,760,000 seconds. Default is 60 seconds"
  default     = 60
}

variable "gcs_bucket_location" {
  type        = string
  description = "Location of sink dataset. Default set to US. See https://cloud.google.com/bigquery/docs/locations for a full list of locations"
  default     = "US"
}

variable "sink_name" {
  type        = string
  description = "Name of org sink"
}

variable "gcs_bucket_name" {
  type        = string
  description = "The name of the bucket. See naming requirements here: https://cloud.google.com/storage/docs/naming"
}

variable "sink_filter" {
  type        = string
  description = "Any filters desired for sink. Leave blank to recieve all logs"
}

variable "organization_id" {
  type        = string
  description = "Org ID for sink to collect logs from"
}

variable "object_age_move_to_nearline" {
  type        = number
  description = "Age of object, in days, in bucket before it's move to Nearline. Understand pricing before selecting: https://cloud.google.com/storage/pricing."
}

variable "object_age_move_to_coldline" {
  type        = number
  description = "Age of object, in days, in bucket before it's move to Nearline. Understand pricing before selecting: https://cloud.google.com/storage/pricing."
}