resource "oci_core_subnet" "dmz" {
    compartment_id      = var.target_compartment
    vcn_id              = oci_core_vcn.vcns.id
    cidr_block          = var.dmz_cidr
    display_name        = var.virtual_network_cnf["DMZ_DISPLAY_NAME"]
    dns_label           = var.virtual_network_cnf["DMZ_DNS_LABEL"]
    dhcp_options_id     = oci_core_dhcp_options.dhcp_options.id
    prohibit_public_ip_on_vnic = false
    route_table_id      = oci_core_route_table.pub.id
    security_list_ids   = [
        oci_core_security_list.dmz.id,
  ]
}