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
  IAM Policy Data
 *****************************************/

data "google_iam_policy" "project_iam_policy_data" {

  # Project Admins & Appropriate Service Accounts

  binding {
    role = "roles/viewer"
    members = [
      "group:${var.project_viewer_group}",
    ]
  }

}

/******************************************
  IAM Policy Applied to Project
 *****************************************/

resource "google_project_iam_policy" "project_iam_policy" {
  depends_on  = [google_project.project, google_project_service.enable_monitoring_api, google_project_service.enable_logging_api]
  policy_data = data.google_iam_policy.project_iam_policy_data.policy_data
  project     = google_project.project.project_id
}
