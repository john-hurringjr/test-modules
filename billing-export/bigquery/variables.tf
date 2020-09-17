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
  description = "Project ID which will host the bigquery dataset for the billing sink"
}

variable "bigquery_dataset_friendly_name" {
  type        = string
  description = "Friendly name for dataset"
}

variable "bigquery_dataset_location" {
  type        = string
  description = "Location of sink dataset. Default set to US. See https://cloud.google.com/bigquery/docs/locations for a full list of locations"
  default     = "US"
}

variable "bigquery_dataset_id" {
  type        = string
  description = "A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters."
}

variable "organization_id" {
  type        = string
  description = "Org ID for sink to collect logs from"
}

variable "billing_account_id" {
  description = "Billing Account ID"
}