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
  Cloud Router
 *****************************************/

resource "google_compute_router" "cloud_nat_router" {
  name    = "${var.network_name}-${var.nat_region}-nat-router"
  project = var.project_id
  region  = var.nat_region
  network = var.network_self_link
  bgp {
    asn = var.cloud_router_asn_number
  }
}

/******************************************
  Cloud NAT
 *****************************************/

resource "google_compute_router_nat" "cloud_nat" {
  name                               = "${var.network_name}-${var.nat_region}-nat"
  project                            = var.project_id
  router                             = google_compute_router.cloud_nat_router.name
  region                             = var.nat_region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = ""
  }
}