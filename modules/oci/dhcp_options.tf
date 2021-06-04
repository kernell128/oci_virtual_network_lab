resource "oci_core_dhcp_options" "dhcp_options" {
  compartment_id = var.target_compartment
  vcn_id         = oci_core_vcn.vcns.id
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
  options {
    type                = "SearchDomain"
    search_domain_names = ["oraclevcn.com"]
  }
  display_name = "dhcp_options"
}
