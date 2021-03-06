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
  Outputs
 *****************************************/


output "router_self_link" {
  value       = google_compute_router.cloud_nat_router.self_link
  description = "Self link of router set up for Cloud NAT"
}

output "router_id" {
  value       = google_compute_router.cloud_nat_router.id
  description = "ID for router set up for Cloud NAT"
}

output "cloud_nat_id" {
  value       = google_compute_router_nat.cloud_nat.id
  description = "Cloud NAT ID"
}