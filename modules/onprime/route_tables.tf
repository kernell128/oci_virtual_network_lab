resource "oci_core_route_table" "pub" {   
    compartment_id          = var.target_compartment
    vcn_id                  = oci_core_vcn.vcns.id
    display_name            = var.virtual_network_cnf["RT_DMZ_DISPLAY_NAME"]
    route_rules {
        description         = "Internet Gatway"
        destination         = "0.0.0.0/0"
        destination_type    = "CIDR_BLOCK"
        network_entity_id   = oci_core_internet_gateway.igw.id
    }
}