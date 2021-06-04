resource "oci_core_security_list" "dmz" {
  compartment_id = var.target_compartment
  vcn_id         = oci_core_vcn.vcns.id
  display_name   = "sl_dmz"
  egress_security_rules {
    destination      = "0.0.0.0/0"
    protocol         = "all"
    description      = "Egress SVC Rule Allow - TCP All Outbound"
    destination_type = "CIDR_BLOCK"
  }
  ingress_security_rules {
    description = "Allow ICMP - Sample CIDRs ASH"
    protocol    = 1
    source      = var.vcn_ash_cidr
    stateless   = false
  }
  ingress_security_rules {
    description = "Allow ICMP - Sample CIDRs PHX"
    protocol    = 1
    source      = var.vcn_phx_cidr
    stateless   = false
  }
  ingress_security_rules {
    description = "Allow ICMP - Sample CIDRs GRU"
    protocol    = 1
    source      = var.vcn_gru_cidr
    stateless   = false
  }
  ingress_security_rules {
    description = "Allow ICMP - Sample CIDRs VCP"
    protocol    = 1
    source      = var.vcn_vcp_cidr
    stateless   = false
  }
  ingress_security_rules {
    description = "Allow ICMP - Sample CIDRs SCL"
    protocol    = 1
    source      = var.vcn_scl_cidr
    stateless   = false
  }
  ingress_security_rules {
    description = "Allow All - OnPrime"
    protocol    = "all"
    source      = var.wonka_dmz_cidr
    stateless   = false
  }
  ingress_security_rules {
    description = "Allow All NOC - iPSEC"
    protocol    = "all"
    source      = var.vpn_client_cidr
    stateless   = false
  }
  ingress_security_rules {
    description = "Allow SSH for test bastion"
    protocol    = "6"
    source      = "0.0.0.0/0"
    stateless   = false
    tcp_options {
      min = 22
      max = 22
    }
  }
}
