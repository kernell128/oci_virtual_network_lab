resource "oci_core_security_list" "dmz" {
  compartment_id = var.target_compartment
  vcn_id         = oci_core_vcn.vcns.id
  display_name   = var.virtual_network_cnf["SL_DMZ_DISPLAY_NAME"]
  egress_security_rules {
    destination      = var.virtual_network_cnf["SN_DMZ_WIDE_IN"]
    protocol         = "all"
    description      = "Egress SVC Rule Allow - TCP All Outbound"
    destination_type = "CIDR_BLOCK"
  }
  ingress_security_rules {
    protocol    = "6"
    source      = var.virtual_network_cnf["SN_DMZ_WIDE_IN"]
    stateless   = false
    description = "Allow HTTPS - Inbound"
    tcp_options {
      min = 443
      max = 443
    }
  }
  ingress_security_rules {
    protocol    = "17"
    source      = var.virtual_network_cnf["SN_DMZ_WIDE_IN"]
    source_type = "CIDR_BLOCK"
    stateless   = false
    description = "OpenVPN ingress"
    udp_options {
      min = 1194
      max = 1194
    }
  }
  ingress_security_rules {
    protocol    = "17"
    source      = var.virtual_network_cnf["SN_DMZ_WIDE_IN"]
    source_type = "CIDR_BLOCK"
    stateless   = false
    description = "IPSEC ingress"
    udp_options {
      min = 500
      max = 500
    }
  }
}
