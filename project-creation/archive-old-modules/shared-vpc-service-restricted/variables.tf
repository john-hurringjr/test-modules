
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

variable "project_friendly_name" {
  description = "Friendly name to be displayed for project. May include spaces"
  type        = string
  default     = ""
}

variable "unique_shared_id" {
  description = "A unique ID for your org to start all project IDs"
  type        = string
  default     = ""
}

variable "environment" {
  description = "A unique identifier for developers and application owners to recognize environment (e.g. dev, test, prod, sbx)"
  type        = string
  default     = ""
}

variable "unique_project_identifier" {
  description = "A unique identifier for the project. Must not contain spaces, but may use dashes."
  type        = string
  default     = ""
}

variable "folder_id" {
  description = "The folder ID of where the project will reside."
  type        = string
  default     = ""
}

variable "billing_account_id" {
  description = "Billing Account ID where costs of the project will be charged."
  type        = string
  default     = ""
}

variable "label_business_unit" {
  description = "Example label for project."
  type        = string
  default     = ""
}

variable "label_restrictions" {
  description = "Example label for project."
  type        = string
  default     = ""
}

variable "project_admin_group_id" {
  description = "Group who will have admin permissions for project"
  type        = string
  default     = ""
}

variable "shared_vpc_host_project_id" {
  description = "Project ID of Shared VPC Host Project"
  type        = string
  default     = ""
}