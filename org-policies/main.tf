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
resource "google_organization_policy" "app_eng_disable_code_download" {
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
resource "google_organization_policy" "functions_allowed_ingress_settings" {
  constraint  = "constraints/cloudfunctions.allowedIngressSettings"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = ["ALLOW_INTERNAL_ONLY"]
    }
  }

}

# Allowed VPC Connector egress settings (Cloud Functions)
resource "google_organization_policy" "functions_allowed_vpc_connector_egress_settings" {
  constraint  = "constraints/cloudfunctions.allowedVpcConnectorEgressSettings"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = ["PRIVATE_RANGES_ONLY"]
    }
  }

}

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
resource "google_organization_policy" "gce_disable_guest_attributes_access" {
  constraint = "constraints/compute.disableGuestAttributesAccess"
  org_id = var.organization_id

  boolean_policy {
    enforced = true
  }

}


# Disable Internet Network Endpoint Groups
resource "google_organization_policy" "gce_disable_internet_network_endpoint_group" {
  constraint = "constraints/compute.disableInternetNetworkEndpointGroup"
  org_id = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable VM nested virtualization
resource "google_organization_policy" "gce_disable_nested_virtualization" {
  constraint = "constraints/compute.disableNestedVirtualization"
  org_id = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable VM serial port access
resource "google_organization_policy" "gce_disable_serial_port_access" {
  constraint  = "compute.disableSerialPortAccess"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable VM serial port logging to Stackdriver	(Cloud Operations)
resource "google_organization_policy" "gce_disable_serial_port_logging" {
  constraint  = "compute.disableSerialPortLogging"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Require OS Login
resource "google_organization_policy" "gce_require_os_login" {
  constraint  = "constraints/compute.requireOsLogin"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Shielded VMs
resource "google_organization_policy" "gce_require_shielded_vm" {
  constraint  = "constraints/compute.requireShieldedVm"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Restrict Authenticated Google Connection


# Restrict Cloud NAT usage
resource "google_organization_policy" "gce_restrict_cloud_nat_usage" {
  constraint  = "constraints/compute.restrictCloudNATUsage"
  org_id      = var.organization_id

  list_policy {
    deny {
      all = true
    }
  }

}

# Restrict Dedicated Interconnect usage


# Restrict Direct Google Access


# Restrict Load Balancer Creation Based on Load Balancer Types
resource "google_organization_policy" "gce_restrict_load_balancer_creation_for_types" {
  constraint  = "constraints/compute.restrictLoadBalancerCreationForTypes"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = ["INTERNAL_TCP_UDP", "INTERNAL_HTTP_HTTPS"]
    }
  }

}

# Restrict Non-Confidential Computing
resource "google_organization_policy" "gce_restrict_non_confidential_computing" {
  constraint  = "constraints/compute.restrictNonConfidentialComputing"
  org_id      = var.organization_id

  list_policy {
    deny {
      all = true
    }
  }

}

# Restrict Partner Interconnect usage



# Restrict Protocol Forwarding Based on type of IP Address
resource "google_organization_policy" "gce_restrict_protocol_forwarding_creation_for_types" {
  constraint  = "constraints/compute.restrictProtocolForwardingCreationForTypes"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = ["INTERNAL"]
    }
  }

}


# Restrict Shared VPC Host Projects


# Restrict Shared VPC Subnetworks


# Restrict VPC peering usage
resource "google_organization_policy" "gce_restrict_vpc_peering_usage" {
  constraint  = "constraints/compute.restrictSharedVpcSubnetworks"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = ["under:organizations/${var.organization_id}"]
    }
  }

}

# Restrict VPN Peer IPs


# Skip default network creation
resource "google_organization_policy" "gce_skip_default_network_creation" {
  constraint  = "constraints/compute.skipDefaultNetworkCreation"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Compute Storage resource use restrictions (Compute Engine disks, images, and snapshots)
resource "google_organization_policy" "gce_restrict_storage_resources" {
  constraint  = "constraints/compute.storageResourceUseRestrictions"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = [
        "under:organizations/${var.organization_id}",
        "under:projects/debian-cloud",
        "under:projects/cos-cloud",
        "under:projects/centros-cloud",
        "under:projects/ubuntu-os-cloud"
      ]
    }
  }

}

# Define trusted image projects


# Restrict VM IP Forwarding
resource "google_organization_policy" "gce_vm_can_ip_forward" {
  constraint  = "compute.vmCanIpForward"
  org_id      = var.organization_id

  list_policy {
    deny {
      all = true
    }
  }

}

# Define allowed external IPs for VM instances
resource "google_organization_policy" "gce_vm_external_ip_access" {
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
# Do not wish to use this at the Org node level, but rather in specific use cases.


/******************************************
  Identity and Access Management
 *****************************************/

# Allow extending lifetime of OAuth 2.0 access tokens to up to 12 hours
# Do not wish to use this at the Org node level, but rather in specific use cases.

# Domain restricted sharing
resource "google_organization_policy" "iam_allowed_policy_member_domains" {
  constraint  = "iam.allowedPolicyMemberDomains"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = var.domain_identities
    }
  }

}

# Disable service account creation
# Do not wish to use this at the Org node level, but rather in specific use cases.

# Disable service account key creation
resource "google_organization_policy" "iam_disable_service_account_key_creation" {
  constraint  = "iam.disableServiceAccountKeyCreation"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable Service Account Key Upload
resource "google_organization_policy" "iam_disable_service_account_key_upload" {
  constraint  = "constraints/iam.disableServiceAccountKeyUpload"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable Workload Identity Cluster Creation


/******************************************
  Resource Manager
 *****************************************/

# Restrict shared VPC project lien removal



/******************************************
  Service Customer Management
 *****************************************/

# Disable Automatic IAM Grants for Default Service Accounts
resource "google_organization_policy" "scm_automatic_iam_grants_for_default_service_accounts" {
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
# Do not wish to use this at the Org node level, but rather in specific use cases.


# Enforce uniform bucket-level access
resource "google_organization_policy" "gcs_uniform_bucket_level_access" {
  constraint  = "constraints/storage.uniformBucketLevelAccess"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}