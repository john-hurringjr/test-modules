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
  description = "Identifies project where the route will be applied."
  type        = string
  default     = ""
}

variable "network_self_link" {
  description = "Self link of vpc which the route will be applied."
  type        = string
  default     = ""
}

variable "region" {
  description = "Region the subnet will reside in"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "Name of network the subnet will reside inside of; this will be used in subnet name"
  type        = string
  default     = ""
}

variable "subnet_number" {
  description = "Used to number subnets in the same region. Default is 1."
  type        = string
  default     = "1"
}

variable "primary_cidr" {
  description = "Subnet cidr range"
  type        = string
  default     = ""
}

variable "alias_gke_pod_cidr" {
  description = "Subnet cidr range"
  type        = string
  default     = ""
}

variable "alias_gke_service_cidr" {
  description = "Subnet cidr range"
  type        = string
  default     = ""
}

variable "vpc_flow_log_interval" {
  description = "Toggles the aggregation interval for collecting flow logs. Increasing the interval time will reduce the amount of generated flow logs for long lasting connections. Default is an interval of 5 seconds per connection. Possible values are INTERVAL_5_SEC, INTERVAL_30_SEC, INTERVAL_1_MIN, INTERVAL_5_MIN, INTERVAL_10_MIN, INTERVAL_15_MIN"
  type        = string
  default     = ""
}

variable "vpc_flow_log_sampling" {
  description = "Set the sampling rate of VPC flow logs within the subnetwork where 1.0 means all collected logs are reported and 0.0 means no logs are reported. Default is 0.5 which means half of all collected logs are reported."
  type        = number
  default     = 0.5
}

variable "private_google_access" {
  description = "Enable private Google Access for subnet. Default is true"
  type        = bool
  default     = true
}