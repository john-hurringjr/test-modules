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

output "route_destination_range" {
  value       = google_compute_route.route.dest_range
  description = "Destination range for route created"
}

output "route_id" {
  value       = google_compute_route.route.id
  description = "ID for route created"
}

output "route_self_link" {
  value       = google_compute_route.route.self_link
  description = "Self link for route created"
}