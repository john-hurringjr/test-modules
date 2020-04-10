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
  Variables Bucket
 *****************************************/
# This bucket will host your backend.tf files and auto.tfvars files
resource "google_storage_bucket" "gcs_bucket_for_backend_var_files" {
  name                = var.gcs_backend_variables_unique_id
  project             = var.project_id
  location            = "US"
  storage_class       = "MULTI_REGIONAL"
  bucket_policy_only  = true

  versioning {
    enabled = true
  }

}

resource "google_storage_bucket_object" "org_node_stuff_vars" {
  bucket  = google_storage_bucket.gcs_bucket_for_backend_var_files.name
  name    = "01-org-node-stuff/blankforfolder"
  content = "nada"
}

resource "google_storage_bucket_object" "folder_structure_and_policies_vars" {
  bucket  = google_storage_bucket.gcs_bucket_for_backend_var_files.name
  name    = "/02-folder-structure-and-policies/blankforfolder"
  content = "nada2"
}

resource "google_storage_bucket_object" "shared_services_projects_vars" {
  bucket  = google_storage_bucket.gcs_bucket_for_backend_var_files.name
  name    = "03-shared-services-projects/"
  content = "object/"
}

resource "google_storage_bucket_object" "shared_services_resources_vars" {
  bucket  = google_storage_bucket.gcs_bucket_for_backend_var_files.name
  name    = "04-shared-services-resources/"
  content = "/object/"
}

resource "google_storage_bucket_object" "prod_projects_vars" {
  bucket  = google_storage_bucket.gcs_bucket_for_backend_var_files.name
  name    = "/05-prod-projects/test/"
  content = "object"
}

resource "google_storage_bucket_object" "non_prod_projects_vars" {
  bucket  = google_storage_bucket.gcs_bucket_for_backend_var_files.name
  name    = "06-non-prod-projects/"
  content = " "
}

resource "google_storage_bucket_object" "prod_resources_vars" {
  bucket  = google_storage_bucket.gcs_bucket_for_backend_var_files.name
  name    = "07-prod-resources/"
  content = " "
}

resource "google_storage_bucket_object" "non_prod_resources_vars" {
  bucket  = google_storage_bucket.gcs_bucket_for_backend_var_files.name
  name    = "08-non-prod-resources/"
  content = " "
}



/******************************************
  State Files Bucket
 *****************************************/

# This bucket will host your backend.tf files and auto.tfvars files
resource "google_storage_bucket" "gcs_bucket_for_state_files" {
  name                = var.gcs_backend_state_files_unique_id
  project             = var.project_id
  location            = "US"
  storage_class       = "MULTI_REGIONAL"
  bucket_policy_only  = true

  versioning {
    enabled = true
  }

}

resource "google_storage_bucket_object" "org_node_stuff_state" {
  bucket  = google_storage_bucket.gcs_bucket_for_state_files.name
  name    = "01-org-node-stuff/"
  content = " "
}

resource "google_storage_bucket_object" "folder_structure_and_policies_state" {
  bucket  = google_storage_bucket.gcs_bucket_for_state_files.name
  name    = "02-folder-structure-and-policies/"
  content = " "
}

resource "google_storage_bucket_object" "shared_services_projects_state" {
  bucket  = google_storage_bucket.gcs_bucket_for_state_files.name
  name    = "03-shared-services-projects/"
  content = " "
}

resource "google_storage_bucket_object" "shared_services_resources_state" {
  bucket  = google_storage_bucket.gcs_bucket_for_state_files.name
  name    = "04-shared-services-resources/"
  content = " "
}

resource "google_storage_bucket_object" "prod_projects_state" {
  bucket  = google_storage_bucket.gcs_bucket_for_state_files.name
  name    = "05-prod-projects/"
  content = " "
}

resource "google_storage_bucket_object" "non_prod_projects_state" {
  bucket  = google_storage_bucket.gcs_bucket_for_state_files.name
  name    = "06-non-prod-projects"
  content = " "
}

resource "google_storage_bucket_object" "prod_resources_state" {
  bucket  = google_storage_bucket.gcs_bucket_for_state_files.name
  name    = "07-prod-resources/"
  content = " "
}

resource "google_storage_bucket_object" "non_prod_resources_state" {
  bucket  = google_storage_bucket.gcs_bucket_for_state_files.name
  name    = "08-non-prod-resources/"
  content = " "
}