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

variable "unique_project_id" {
  description = "A unique ID for your org to start all project IDs"
  type        = string
  default     = ""
}

variable "org_id" {
  description = "The folder ID of where the project will reside."
  type        = string
  default     = ""
}

variable "billing_account_id" {
  description = "Billing Account ID where costs of the project will be charged."
  type        = string
  default     = ""
}

variable "apis_to_enable" {
  type = list(string)
}