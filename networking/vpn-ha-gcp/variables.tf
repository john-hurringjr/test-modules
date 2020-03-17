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

variable "project_1_id" {
  description = "Identifies the project which hosts the first network for the vpn connect."
  type        = string
  default     = ""
}

variable "network_1_self_link" {
  description = "Self link of the first vpc in vpn setup"
  type        = string
  default     = ""
}

variable "network_1_name" {
  description = "Name of first network in the vpn setup"
  type        = string
  default     = ""
}

variable "network_1_router_bgp_asn" {
  description = "BGP ASN for router in network 1"
  type        = number
}

variable "project_2_id" {
  description = "Identifies the project which hosts the second network for the vpn connect."
  type        = string
  default     = ""
}

variable "network_2_self_link" {
  description = "Self link of the second vpc in vpn setup"
  type        = string
  default     = ""
}

variable "network_2_name" {
  description = "Name of second network in the vpn setup"
  type        = string
  default     = ""
}

variable "network_2_router_bgp_asn" {
  description = "BGP ASN for router in network 2"
  type        = number
}

variable "shared_secret_tunnel_1" {
  description = "Shared Secret for VPN tunnel 1"
  type        = string
}

variable "shared_secret_tunnel_2" {
  description = "Shared Secret for VPN tunnel 2"
  type        = string
}


variable "region" {
  description = "Region the vpn will connect"
  type        = string
  default     = ""
}

