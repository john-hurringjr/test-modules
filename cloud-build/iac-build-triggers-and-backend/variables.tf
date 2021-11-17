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

variable "code_folders" {
  type = list(string)
  description = "A list of all the folders you have created that will deploy. Base example includes the first six: 00-triggers, 01-org-iam, 02-org-policies-org-node, 03-folders-and-folder-iam, 04-suggested-projects, 05-simple-networking, 06-org-log-sinks"
}

variable "push_branch_trigger_plan" {
  default = "development"
  type = string
  description = "What branch do you want a trigger to run for a Terraform Plan"
}

variable "github_repo_owner" {
  type = string
  description = "What is the owner of the repo?  For example: The owner for https://github.com/googlecloudplatform/cloud-builders is googlecloudplatform."
}

variable "github_repo_name" {
  type = string
  description = "What is the name of the repo under that owner? For example: The name for https://github.com/googlecloudplatform/cloud-builders is cloud-builders"
}

variable "gcs_terraform_backend_bucket_location" {
  type = string
  default = "US"
  description = "Must be multiregional location such as ASIA US EU. Default is US."
}
