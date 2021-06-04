
provider "oci" {
  alias            = "ash"
  region           = "us-ashburn-1"
  tenancy_ocid     = local.tenancy_ocid
  user_ocid        = local.user_ocid
  fingerprint      = local.fingerprint
  private_key_path = local.private_key_path
}
provider "oci" {
  alias            = "phx"
  region           = "us-phoenix-1"
  tenancy_ocid     = local.tenancy_ocid
  user_ocid        = local.user_ocid
  fingerprint      = local.fingerprint
  private_key_path = local.private_key_path
}
provider "oci" {
  alias            = "gru"
  region           = "sa-saopaulo-1"
  tenancy_ocid     = local.tenancy_ocid
  user_ocid        = local.user_ocid
  fingerprint      = local.fingerprint
  private_key_path = local.private_key_path
}
provider "oci" {
  alias            = "vcp"
  region           = "sa-vinhedo-1"
  tenancy_ocid     = local.tenancy_ocid
  user_ocid        = local.user_ocid
  fingerprint      = local.fingerprint
  private_key_path = local.private_key_path
}
provider "oci" {
  alias            = "scl"
  region           = "sa-santiago-1"
  tenancy_ocid     = local.tenancy_ocid
  user_ocid        = local.user_ocid
  fingerprint      = local.fingerprint
  private_key_path = local.private_key_path
}