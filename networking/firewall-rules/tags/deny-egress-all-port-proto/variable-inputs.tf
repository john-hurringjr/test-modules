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
  description = "Identifies project which hosts the VPC where this rule will be applied."
  type        = string
  default     = ""
}

variable "network_self_link" {
  description = "Self link of vpc which this rule will be applied."
  type        = string
  default     = ""
}

variable "network_name" {
  description = "Name of VPC which this rule will be applied. Will be used to construct rule name."
  type        = string
  default     = ""
}

variable "priority" {
  description = "Identified priority of rule. Default is 1000"
  type        = number
  default     = 1000
}

variable "enable_logging" {
  description = "Defaults to true. Set to false to disable logging."
  type        = bool
  default     = true
}

variable "target_tag" {
  description = "Tag to be used to apply firewall rule. Defaults to 'deny-all-egress'."
  type        = "string"
  default     = "deny-all-egress"
}