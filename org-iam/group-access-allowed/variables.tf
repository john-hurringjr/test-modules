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

variable "organization_admins_group" {
  type        = string
  description = "Must be group. Group identity of organization admins"
}

variable "terraform_service_account" {
  type        = string
  description = "Service Account identity (email) that will be deploying the infrastructure"
}

variable "network_admins_group" {
  type        = string
  description = "Must be group. Group identity of network admins"
}

variable "security_admins_group" {
  type        = string
  description = "Must be group. Group identity of security admins"
}

variable "external_user_os_login_group" {
  type        = string
  description = "Must be group. Group identity of users who are external to org, but require os login access"
}

variable "sre_group" {
  type        = string
  description = "Must be group. Group identity of SREs"
}

variable "organization_id" {
  type        = string
  description = "Root domain identity. Allows all users with identity in domain to see org node. Helps users know they are working within appropriate space"
}

variable "billing_admins_group" {}