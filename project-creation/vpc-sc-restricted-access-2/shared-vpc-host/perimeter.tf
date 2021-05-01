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
  VPC SC Perimeter
 *****************************************/

resource "google_access_context_manager_service_perimeter_resource" "service_perimeter_resource_add" {
  depends_on      = [google_project.project, google_project_service.enable_compute_api, google_compute_shared_vpc_host_project.promote_to_host]
  perimeter_name  = var.service_perimeter_name
  resource        = "projects/${google_project.project.number}"
}