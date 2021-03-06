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
  Firewall Rule
 *****************************************/

resource "google_compute_firewall" "firewall_rule" {
  provider            = google-beta
  project             = var.project_id
  name                = "${var.network_name}-allow-all-rfc-1918-egress-limited"
  network             = var.network_self_link
  description         = "Allows egress of SSH, RDP, HTTPS to all rfc1918 ranges."
  direction           = "EGRESS"
  priority            = var.priority
  destination_ranges  = ["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]

  log_config {
    metadata = var.logging_metadata
  }

  allow {
    protocol = "tcp"
    ports = ["22", "3389", "443"]
  }

}