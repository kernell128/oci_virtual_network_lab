resource "oci_core_subnet" "dmz" {
    compartment_id      = var.target_compartment
    vcn_id              = oci_core_vcn.vcns.id
    cidr_block          = cidrsubnet(lookup(var.cidrs_map, var.deploy), 8, 0)
    display_name        = "dmz"
    dns_label           = "dmz"
    dhcp_options_id     = oci_core_dhcp_options.dhcp_options.id
    prohibit_public_ip_on_vnic = false
    route_table_id      = oci_core_route_table.pub.id
    security_list_ids   = [
        oci_core_security_list.dmz.id,
  ]
}