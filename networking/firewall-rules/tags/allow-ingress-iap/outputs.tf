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


output "firewall_rule_self_link" {
  value       = google_compute_firewall.firewall_rule.self_link
  description = "Self link of firewall rule created"
}
output "firewall_rule_id" {
  value       = google_compute_firewall.firewall_rule.id
  description = "ID of firewall rule created"
}

output "firewall_rule_tag" {
  value       = google_compute_firewall.firewall_rule.target_tags
  description = "Target tag to apply firewall rule"
}