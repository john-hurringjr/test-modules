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
  description = "Project ID of project that will host the gce instance."
  type        = string
}

variable "zone" {
  description = "The zone that the instance will sit in"
  type        = string
}

variable "instance_name" {
  description = "The name of the vm"
  type        = string
}

variable "machine_type" {
  description = "The type of instance. Default n1-standard-2"
  type        = string
  default     = "n1-standard-2"
}

variable "instance_service_account_name" {
  description = "A custom service account to assign to nat instance. May be used to provide necessary IAM permissions (e.g. Log Writer). Default: nat-gateway-instance"
  type        = string
  default     = "nat-gateway-instance"
}

variable "subnet_self_link" {
  description = "The self link of the subnet that the vm will be deployed to."
  type        = string
}

variable "instance_disk_size" {
  description = "Size, in GB, of instance persistent disk. Default is 75GB."
  type        = number
  default     = 75

}

variable "instance_network_tag" {
  description = "A network tag to apply to instance. May be used to help provide instance different route than rest of vpc."
  type        = string

}