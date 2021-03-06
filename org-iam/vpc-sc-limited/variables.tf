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

variable "group_break_glass" {
  type        = string
  description = "Must be group, shoudl have null membership. Only add members when something breaks..."
}

variable "terraform_org_service_account" {
  type        = string
  description = "Service Account identity (email) that will be deploying the org node infrastructure"
}

variable "terraform_prod_prj_creator_service_account" {
  type        = string
  description = "Service Account identity (email) that will be deploying the production projects"
}

variable "terraform_non_prod_prj_creator_service_account" {
  type        = string
  description = "Service Account identity (email) that will be deploying the non-production projects"
}

variable "external_user_os_login_group" {
  type        = string
  description = "Must be group. Group identity of users who are external to org, but require os login access"
}

variable "security_viewer_group" {
  type        = string
  description = "Must be group. Group identity of security admins"
}

variable "billing_admins_group" {}

variable "organization_id" {
  type        = string
  description = "Root domain identity. Allows all users with identity in domain to see org node. Helps users know they are working within appropriate space"
}