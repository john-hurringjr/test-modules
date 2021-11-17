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
  Plan Trigger
 *****************************************/

resource "google_cloudbuild_trigger" "push_and_plan_trigger" {
  name = "manage-triggers-push-and-plan"
  project = var.project_id

  service_account = google_service_account.sa_00_trigger.id

  github {
    owner = var.github_repo_owner
    name = var.github_repo_name
    push {
      branch = var.push_branch_trigger_plan
    }
  }
  included_files = ["${var.first_trigger_folder}/**"]

  build {

    logs_bucket = google_storage_bucket.cloud_build_logs_bucket.id

    step {
      name = "hashicorp/terraform"
      dir = "./${var.first_trigger_folder}/"
      args = ["init"]
    }
    step {
      name = "hashicorp/terraform"
      dir = "./${var.first_trigger_folder}/"
      args = ["plan"]
    }
    timeout = "7200s"
  }


}

/******************************************
  Apply Trigger
 *****************************************/

resource "google_cloudbuild_trigger" "pull_and_apply_trigger" {
  name = "manage-triggers-pull-and-apply"
  project = var.project_id

  service_account = google_service_account.sa_00_trigger.id

  github {
    owner = var.github_repo_owner
    name = var.github_repo_name
    push {
      branch = var.push_branch_trigger_plan
    }
  }
  included_files = ["${var.first_trigger_folder}/**"]

  build {

    logs_bucket = google_storage_bucket.cloud_build_logs_bucket.id

    step {
      name = "hashicorp/terraform"
      dir = "./${var.first_trigger_folder}/"
      args = ["init"]
    }
    step {
      name = "hashicorp/terraform"
      dir = "./${var.first_trigger_folder}/"
      args = ["apply", "--auto-approve"]
    }
    timeout = "7200s"
  }


}