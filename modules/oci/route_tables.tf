resource "oci_core_route_table" "pub" {
  compartment_id = var.target_compartment
  vcn_id         = oci_core_vcn.vcns.id
  display_name   = "pub_${var.deploy}"
  dynamic "route_rules" {
    for_each = var.dynamic_rules_cidrs
    content {
      description       = "OCI Deployment CIDRs"
      destination       = route_rules.value
      destination_type  = "CIDR_BLOCK"
      network_entity_id = oci_core_drg.drg.id
    }
  }
  route_rules {
    description       = "IGW Default route"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
  route_rules {
    description       = "NOC - iPSEC"
    destination       = var.vpn_client_cidr
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.drg.id
  }
  route_rules {
    description       = "OnPrime"
    destination       = var.wonka_dmz_cidr
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.drg.id
  }
}
resource "oci_core_route_table" "drg_attach" {
  compartment_id = var.target_compartment
  vcn_id         = oci_core_vcn.vcns.id
  display_name   = "drg_attach_${var.deploy}"
}
