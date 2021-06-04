variable "target_compartment" {}
variable "pf_image_id" {}
variable "dmz_cidr" {}
variable "wonka_cidr" {}
variable "tenancy_ocid" {}
variable "instance_shape" {
  default = "VM.Standard.E3.Flex"
}


variable "virtual_network_cnf" {
  type = map(any)
  default = {
    DNS_LABEL                 = "wonka"
    DISPLAY_NAME              = "wonka"
    DMZ_DISPLAY_NAME          = "dmz"
    DMZ_DNS_LABEL             = "dmz"
    SL_DMZ_DISPLAY_NAME       = "sl_dmz"
    RT_DMZ_DISPLAY_NAME       = "rt_dmz"
    IGW_DISPLAY_NAME          = "igw"
    DHCP_OPTIONS_DISPLAY_NAME = "wonka_dhcp_options"
    PF1_DISPLAY_NAME          = "wonka_pf1"
    PF1_FT                    = "FAULT-DOMAIN-3"
    SN_DMZ_WIDE_IN            = "0.0.0.0/0"
  }
}
