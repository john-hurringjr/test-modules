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
  Service Account
 *****************************************/

resource "google_service_account" "instance_service_account" {
  project     = var.project_id
  account_id  = var.instance_service_account_name
}

/******************************************
  GCE VM
 *****************************************/

resource "google_compute_instance" "nat_instance" {
  project         = var.project_id
  zone            = var.zone
  machine_type    = var.machine_type
  name            = var.instance_name
  can_ip_forward  = true

  service_account {
    email = google_service_account.instance_service_account.email
    scopes = ["cloud-platform"]
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      type  = "pd-ssd"
      size  = var.instance_disk_size
    }
  }

  metadata_startup_script = file("./startup-script.sh")

  network_interface {
    subnetwork = var.subnet_self_link
    access_config {

    }

  }

}