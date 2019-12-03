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
  provider        = google-beta
  project         = var.project_id
  name            = "${var.network_name}-allow-iap-ingress-tag"
  network         = var.network_self_link
  direction       = "INGRESS"
  priority        = var.priority
  enable_logging  = var.enable_logging
  source_ranges   = ["35.235.240.0/20"]
  target_tags     = [var.target_tag]

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

}
