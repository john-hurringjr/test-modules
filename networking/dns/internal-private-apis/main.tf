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
  Cloud DNS - Internal
 *****************************************/

resource "google_dns_managed_zone" "private_zone" {
  project     = var.project_id
  name        = "private-api-zone${var.unique_zone_name_addition}"
  dns_name    = "googleapis.com."
  description = "Google Private API Access"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  var.network_self_link
    }
  }
}

resource "google_dns_record_set" "private_api_access_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.private_zone.name
  name          = "private.googleapis.com."
  rrdatas       = ["199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "private_api_access_cname_record" {
  project       = var.project_id
  name          = "*.googleapis.com."
  managed_zone  = google_dns_managed_zone.private_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["private.googleapis.com."]
}