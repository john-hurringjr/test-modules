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
    role = "roles/appengine.appAdmin"
    members = [

    ]
  }

  binding {
    role = "roles/automl.admin"
    members = [

    ]
  }

  binding {
    role = "roles/bigquery.admin"
    members = [

    ]
  }

  binding {
    role = "roles/bigtable.admin"
    members = [

    ]
  }

  binding {
    role = "roles/binaryauthorization.attestorsAdmin"
    members = [

    ]
  }

  binding {
    role = "roles/binaryauthorization.policyAdmin"
    members = [

    ]
  }


  binding {
    role = "roles/cloudbuild.builds.editor"
    members = [

    ]
  }

  binding {
    role = "roles/cloudfunctions.admin"
    members = [

    ]
  }

  binding {
    role = "roles/cloudiot.admin"
    members = [

    ]
  }

  binding {
    role = "roles/cloudkms.admin"
    members = [

    ]
  }

  binding {
    role = "roles/cloudscheduler.admin"
    members = [

    ]
  }

  binding {
    role = "roles/cloudsql.admin"
    members = [

    ]
  }

  binding {
    role = "roles/cloudtasks.admin"
    members = [

    ]
  }

  binding {
    role = "roles/cloudtrace.admin"
    members = [

    ]
  }

  binding {
    role = "roles/cloudtranslate.admin"
    members = [

    ]
  }

  binding {
    role = "roles/composer.admin"
    members = [

    ]
  }

  binding {
    role = "roles/compute.instanceAdmin.v1"
    members = [

    ]
  }

  binding {
    role = "roles/container.admin"
    members = [

    ]
  }

  binding {
    role = "roles/dataflow.admin"
    members = [

    ]
  }

  binding {
    role = "roles/dataproc.admin"
    members = [

    ]
  }

  binding {
    role = "roles/datastore.owner"
    members = [

    ]
  }

  binding {
    role = "roles/dialogflow.admin"
    members = [

    ]
  }

  binding {
    role = "roles/dlp.admin"
    members = [

    ]
  }

  binding {
    role = "roles/errorreporting.admin"
    members = [

    ]
  }

  binding {
    role = "roles/gkehub.admin"
    members = [

    ]
  }

  binding {
    role = "roles/iam.serviceAccountAdmin"
    members = [

    ]
  }

  binding {
    role = "roles/iam.serviceAccountUser"
    members = [

    ]
  }

  binding {
    role = "roles/iap.admin"
    members = [

    ]
  }

  binding {
    role = "roles/logging.admin"
    members = [

    ]
  }

  binding {
    role = "roles/monitoring.admin"
    members = [

    ]
  }

  binding {
    role = "roles/pubsub.admin"
    members = [

    ]
  }

  binding {
    role = "roles/redis.admin"
    members = [

    ]
  }

  binding {
    role = "roles/run.admin"
    members = [

    ]
  }

  binding {
    role = "roles/secretmanager.admin"
    members = [

    ]
  }

  binding {
    role = "roles/spanner.admin"
    members = [

    ]
  }

  binding {
    role = "roles/storage.admin"
    members = [

    ]
  }

}


