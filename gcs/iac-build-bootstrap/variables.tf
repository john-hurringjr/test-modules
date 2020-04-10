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
  Input Variables
 *****************************************/

variable "project_id" {
  description = "IaC project id"
  type        = string
  default     = ""
}

variable "gcs_backend_variables_unique_id" {
  description = "GCS bucket which will host your backend.tf files and auto.tfvars files"
  type        = string
  default     = ""
}

variable "gcs_backend_state_files_unique_id" {
  description = "GCS bucket which will host your backend state files"
  type        = string
  default     = ""
}
