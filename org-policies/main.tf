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

/******************************************
  App Engine
 *****************************************/

# Disable Source Code Download
resource "google_organization_policy" "app_engine_disable_source_code_download" {
  constraint = "constraints/appengine.disableCodeDownload"
  org_id = var.organization_id

  boolean_policy {
    enforced = true
  }

}

/******************************************
  Cloud Functions
 *****************************************/

# Allowed ingress settings (Cloud Functions)




# Allowed VPC Connector egress settings (Cloud Functions)



# Require VPC Connector (Cloud Functions)



/******************************************
  Cloud SQL
 *****************************************/


# Restrict default Google-managed encryption on Cloud SQL instances




# Restrict Authorized Networks on Cloud SQL instances



# Restrict Public IP access on Cloud SQL instances
resource "google_organization_policy" "cloud_sql_restrict_public_ip" {
  constraint  = "constraints/sql.restrictPublicIp"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

/******************************************
  Compute Engine
 *****************************************/

# Disable Guest Attributes of Compute Engine metadata


# Disable Internet Network Endpoint Groups
resource "google_organization_policy" "disable_neg_groups" {
  constraint = "constraints/compute.disableInternetNetworkEndpointGroup"
  org_id = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable VM nested virtualization


# Disable VM serial port access
resource "google_organization_policy" "disable_serial_port" {
  constraint  = "compute.disableSerialPortAccess"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable VM serial port logging to Stackdriver	(Cloud Operations)
resource "google_organization_policy" "disable_serial_port_logs" {
  constraint  = "compute.disableSerialPortLogging"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Require OS Login
resource "google_organization_policy" "require_os_login" {
  constraint  = "constraints/compute.requireOsLogin"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Shielded VMs


# Restrict Authenticated Google Connection


# Restrict Cloud NAT usage


# Restrict Dedicated Interconnect usage


# Restrict Direct Google Access


# Restrict Load Balancer Creation Based on Load Balancer Types
resource "google_organization_policy" "restrict_load_balancer_creation" {
  constraint  = "constraints/compute.restrictLoadBalancerCreationForTypes"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = ["INTERNAL_TCP_UDP", "INTERNAL_HTTP_HTTPS"]
    }
  }

}

# Restrict Non-Confidential Computing


# Restrict Partner Interconnect usage


# Restrict Shared VPC Host Projects


# Restrict Shared VPC Subnetworks


# Restrict VPC peering usage


# Restrict VPN Peer IPs


# Skip default network creation
resource "google_organization_policy" "skip_default_network_creation" {
  constraint  = "constraints/compute.skipDefaultNetworkCreation"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Compute Storage resource use restrictions (Compute Engine disks, images, and snapshots)


# Restrict VM IP Forwarding
resource "google_organization_policy" "disable_vm_ip_forward" {
  constraint  = "compute.vmCanIpForward"
  org_id      = var.organization_id

  list_policy {
    deny {
      all = true
    }
  }

}

# Define allowed external IPs for VM instances
resource "google_organization_policy" "external_ip_restricted" {
  constraint  = "compute.vmExternalIpAccess"
  org_id      = var.organization_id

  list_policy {
    deny {
      all = true
    }
  }

}

/******************************************
  Cloud Healthcare
 *****************************************/

# Disable Cloud Logging



/******************************************
  Identity and Access Management
 *****************************************/

# Allow extending lifetime of OAuth 2.0 access tokens to up to 12 hours


# Domain restricted sharing
resource "google_organization_policy" "domain_restricted_sharing" {
  constraint  = "iam.allowedPolicyMemberDomains"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = var.domain_identities
    }
  }

}

# Disable service account creation


# Disable service account key creation
resource "google_organization_policy" "disable_sa_keys" {
  constraint  = "iam.disableServiceAccountKeyCreation"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable Service Account Key Upload


# Disable Workload Identity Cluster Creation


/******************************************
  Resource Manager
 *****************************************/

# Restrict shared VPC project lien removal



/******************************************
  Service Customer Management
 *****************************************/

# Disable Automatic IAM Grants for Default Service Accounts
resource "google_organization_policy" "disable_auto_iam_default_sa" {
  constraint  = "iam.automaticIamGrantsForDefaultServiceAccounts"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

/******************************************
  Cloud Storage
 *****************************************/

# Google Cloud Platform - Detailed Audit Logging Mode


# Retention policy duration in seconds



# Enforce uniform bucket-level access
resource "google_organization_policy" "force_gcs_bucket_iam_only" {
  constraint  = "constraints/storage.uniformBucketLevelAccess"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}