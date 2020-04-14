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
  Org Policies
  (Grant exceptions at lower level)
  Check link below for new policies available
  https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints
 *****************************************/

# May only add users to IAM from approved domains
resource "google_organization_policy" "domain_restricted_sharing" {
  constraint  = "iam.allowedPolicyMemberDomains"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = [var.domain_identity_primary, var.domain_identity_secondary]
    }
  }

}

# Disables serial port access to VMs
resource "google_organization_policy" "disable_serial_port" {
  constraint  = "compute.disableSerialPortAccess"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}


# Disable Serial Port Logging for VMs
resource "google_organization_policy" "disable_serial_port_logs" {
  constraint  = "compute.disableSerialPortLogging"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable Service Account Key Creation (Force use of Application Default Credential method)
# You may still grant exceptions where necessary
resource "google_organization_policy" "disable_sa_keys" {
  constraint  = "iam.disableServiceAccountKeyCreation"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable ability to create GCE VM with external IP address
resource "google_organization_policy" "external_ip_restricted" {
  constraint  = "compute.vmExternalIpAccess"
  org_id      = var.organization_id

  list_policy {
    deny {
      all = true
    }
  }

}

resource "google_organization_policy" "disable_vm_ip_forward" {
  constraint  = "compute.vmCanIpForward"
  org_id      = var.organization_id

  list_policy {
    deny {
      all = true
    }
  }

}

resource "google_organization_policy" "disable_auto_iam_default_sa" {
  constraint  = "iam.automaticIamGrantsForDefaultServiceAccounts"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}


# Disable ability to create Cloud SQL with public IP
resource "google_organization_policy" "cloud_sql_restrict_public_ip" {
  constraint  = "constraints/sql.restrictPublicIp"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Enforce use of OS Login API
resource "google_organization_policy" "require_os_login" {
  constraint  = "constraints/compute.requireOsLogin"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Skip creation of default networks
# If using Shared VPCs this can be useful
resource "google_organization_policy" "skip_default_network_creation" {
  constraint  = "constraints/compute.skipDefaultNetworkCreation"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Forces Bucket IAM only
# While it takes away granularity of individual object permissions it also takes away ability to make object public
resource "google_organization_policy" "force_gcs_bucket_iam_only" {
  constraint  = "constraints/storage.uniformBucketLevelAccess"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}


resource "google_organization_policy" "app_engine_disable_source_code_download" {
  constraint = "constraints/appengine.disableCodeDownload"
  org_id = var.organization_id

  boolean_policy {
    enforced = true
  }

}

