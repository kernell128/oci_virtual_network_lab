variable "target_compartment" {}
variable "vcn_ash_cidr" {}
variable "vcn_phx_cidr" {}
variable "vcn_gru_cidr" {}
variable "vcn_vcp_cidr" {}
variable "vcn_scl_cidr" {}
variable "cidrs_map" {}
variable "tenancy_ocid" {}
variable "ssh_public_key" {}
variable "cpe_ip_address" {}
variable "wonka_dmz_cidr" {}
variable "vpn_client_cidr" {}
variable "dynamic_rules_cidrs" {}
//variable private_key_path {}
//variable fingerprint {}
//variable user_ocid {}
variable "environments" {
  type = set(string)
}
//variable target_region {}
variable "deploy" {}
variable "instance_shape" {
  default = "VM.Standard.E3.Flex"
}
variable "shape_config" {
  default = null
  type = object({
    memory_in_gbs = string
    ocpus         = string
  })
}
