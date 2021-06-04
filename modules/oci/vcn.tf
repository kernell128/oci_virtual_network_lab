/*
resource oci_core_vcn vcns {
    for_each = var.environments
    //provider = oci.ash
    compartment_id = var.target_compartment
    cidr_blocks = [
        lookup(var.cidrs_map, each.key),
    ]
    display_name = each.key
    dns_label    = each.key
}
*/

resource oci_core_vcn vcns {
    compartment_id = var.target_compartment
    cidr_blocks = [
        lookup(var.cidrs_map, var.deploy),
    ]
    display_name = var.deploy
    dns_label    = var.deploy
}