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
  Router Creation
 *****************************************/

resource "google_compute_router" "ha_vpn_router_vpc_1" {
  project = var.project_1_id
  network = var.network_1_name
  region  = var.region
  name    = "${var.network_1_name}-ha-vpn-router-${var.region}"

  bgp {
    asn = var.network_1_router_bgp_asn
  }

}

resource "google_compute_router" "ha_vpn_router_vpc_2" {
  project = var.project_2_id
  network = var.network_2_name
  region  = var.region
  name    = "${var.network_2_name}-ha-vpn-router-${var.region}"

  bgp {
    asn = var.network_2_router_bgp_asn
  }

}

/******************************************
  Gateway Creation
 *****************************************/

resource "google_compute_ha_vpn_gateway" "ha_vpn_gateway_vpc_1" {
  provider  = google-beta
  project   = var.project_1_id
  region    = var.region
  name      = "${var.network_1_name}-ha-vpn-gw-${var.region}"
  network   = var.network_1_self_link
}

resource "google_compute_ha_vpn_gateway" "ha_vpn_gateway_vpc_2" {
  provider  = google-beta
  project   = var.project_2_id
  region    = var.region
  name      = "${var.network_2_name}-ha-vpn-gw-${var.region}"
  network   = var.network_2_self_link
}

/******************************************
  Tunnel 1 Creation
 *****************************************/

resource "google_compute_vpn_tunnel" "ha_vpn_vpc_1_tunnel_1" {
  provider        = google-beta
  name            = "${var.network_1_name}-ha-vpn-${var.region}-tunnel-1"
  project         = var.project_1_id
  region          = var.region
  router          = google_compute_router.ha_vpn_router_vpc_1.self_link
  shared_secret   = var.shared_secret_tunnel_1

  vpn_gateway           = google_compute_ha_vpn_gateway.ha_vpn_gateway_vpc_1.name
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_vpn_gateway_vpc_2.name
  vpn_gateway_interface = 0
}

resource "google_compute_vpn_tunnel" "ha_vpn_vpc_2_tunnel_1" {
  provider        = google-beta
  name            = "${var.network_2_name}-ha-vpn-${var.region}-tunnel-1"
  project         = var.project_2_id
  region          = var.region
  router          = google_compute_router.ha_vpn_router_vpc_2.self_link
  shared_secret   = var.shared_secret_tunnel_1

  vpn_gateway           = google_compute_ha_vpn_gateway.ha_vpn_gateway_vpc_2.name
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_vpn_gateway_vpc_1.name
  vpn_gateway_interface = 0
}

/******************************************
  Tunnel 2 Creation
 *****************************************/

resource "google_compute_vpn_tunnel" "ha_vpn_vpc_1_tunnel_2" {
  provider        = google-beta
  name            = "${var.network_1_name}-ha-vpn-${var.region}-tunnel-2"
  project         = var.project_1_id
  region          = var.region
  router          = google_compute_router.ha_vpn_router_vpc_1.self_link
  shared_secret   = var.shared_secret_tunnel_2

  vpn_gateway           = google_compute_ha_vpn_gateway.ha_vpn_gateway_vpc_1.name
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_vpn_gateway_vpc_2.name
  vpn_gateway_interface = 1
}

resource "google_compute_vpn_tunnel" "ha_vpn_vpc_2_tunnel_2" {
  provider        = google-beta
  name            = "${var.network_2_name}-ha-vpn-${var.region}-tunnel-2"
  project         = var.project_2_id
  region          = var.region
  router          = google_compute_router.ha_vpn_router_vpc_2.self_link
  shared_secret   = var.shared_secret_tunnel_2

  vpn_gateway           = google_compute_ha_vpn_gateway.ha_vpn_gateway_vpc_2.name
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.ha_vpn_gateway_vpc_1.name
  vpn_gateway_interface = 1
}

/******************************************
  Router Configuration - Interfaces
 *****************************************/

resource "google_compute_router_interface" "ha_vpn_vpc_1_router_interface_1" {
  provider    = google-beta
  name        = "${var.network_1_name}-ha-vpn-router-${var.region}-interface-1"
  router      = google_compute_router.ha_vpn_router_vpc_1.name
  region      = var.region
  project     = var.project_1_id
  ip_range    = "169.254.0.1/30"
  vpn_tunnel  = google_compute_vpn_tunnel.ha_vpn_vpc_1_tunnel_1.name
}

resource "google_compute_router_interface" "ha_vpn_vpc_1_router_interface_2" {
  provider    = google-beta
  name        = "${var.network_1_name}-ha-vpn-router-${var.region}-interface-1"
  router      = google_compute_router.ha_vpn_router_vpc_1.name
  region      = var.region
  project     = var.project_1_id
  ip_range    = "169.254.1.1/30"
  vpn_tunnel  = google_compute_vpn_tunnel.ha_vpn_vpc_1_tunnel_2.name
}

resource "google_compute_router_interface" "ha_vpn_vpc_2_router_interface_1" {
  provider    = google-beta
  name        = "${var.network_2_name}-ha-vpn-router-${var.region}-interface-1"
  router      = google_compute_router.ha_vpn_router_vpc_2.name
  region      = var.region
  project     = var.project_2_id
  ip_range    = "169.254.0.2/30"
  vpn_tunnel  = google_compute_vpn_tunnel.ha_vpn_vpc_2_tunnel_1.name
}

resource "google_compute_router_interface" "ha_vpn_vpc_2_router_interface_2" {
  provider    = google-beta
  name        = "${var.network_2_name}-ha-vpn-router-${var.region}-interface-1"
  router      = google_compute_router.ha_vpn_router_vpc_2.name
  region      = var.region
  project     = var.project_2_id
  ip_range    = "169.254.1.2/30"
  vpn_tunnel  = google_compute_vpn_tunnel.ha_vpn_vpc_2_tunnel_2.name
}

/******************************************
  Router Configuration - Peer
 *****************************************/

resource "google_compute_router_peer" "ha_vpn_vpc_1_peer_1" {
  provider                  = google-beta
  project                   = var.project_1_id
  region                    = var.region
  peer_ip_address           = "169.254.0.2"
  interface                 = google_compute_router_interface.ha_vpn_vpc_1_router_interface_1.name
  name                      = "${var.network_1_name}-ha-vpn-router-${var.region}-peer-1"
  peer_asn                  = var.network_2_router_bgp_asn
  advertised_route_priority = 100
  router                    = google_compute_router.ha_vpn_router_vpc_1.name
}

resource "google_compute_router_peer" "ha_vpn_vpc_1_peer_2" {
  provider                  = google-beta
  project                   = var.project_1_id
  region                    = var.region
  peer_ip_address           = "169.254.1.2"
  interface                 = google_compute_router_interface.ha_vpn_vpc_1_router_interface_2.name
  name                      = "${var.network_1_name}-ha-vpn-router-${var.region}-peer-1"
  peer_asn                  = var.network_2_router_bgp_asn
  advertised_route_priority = 100
  router                    = google_compute_router.ha_vpn_router_vpc_1.name
}

resource "google_compute_router_peer" "ha_vpn_vpc_2_peer_1" {
  provider                  = google-beta
  project                   = var.project_2_id
  region                    = var.region
  peer_ip_address           = "169.254.0.1"
  interface                 = google_compute_router_interface.ha_vpn_vpc_2_router_interface_1.name
  name                      = "${var.network_2_name}-ha-vpn-router-${var.region}-peer-1"
  peer_asn                  = var.network_1_router_bgp_asn
  advertised_route_priority = 100
  router                    = google_compute_router.ha_vpn_router_vpc_2.name
}

resource "google_compute_router_peer" "ha_vpn_vpc_2_peer_2" {
  provider                  = google-beta
  project                   = var.project_2_id
  region                    = var.region
  peer_ip_address           = "169.254.1.1"
  interface                 = google_compute_router_interface.ha_vpn_vpc_2_router_interface_2.name
  name                      = "${var.network_2_name}-ha-vpn-router-${var.region}-peer-1"
  peer_asn                  = var.network_1_router_bgp_asn
  advertised_route_priority = 100
  router                    = google_compute_router.ha_vpn_router_vpc_2.name
}