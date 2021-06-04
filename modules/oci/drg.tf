resource "oci_core_drg" "drg" {
    compartment_id  = var.target_compartment
    display_name    = var.deploy
}
resource "oci_core_drg_attachment" "drg_attach" {
    drg_id          = oci_core_drg.drg.id
    vcn_id          = oci_core_vcn.vcns.id
    display_name    = "drg_vcn_association_${var.deploy}"
    route_table_id  = oci_core_route_table.drg_attach.id
}

resource "oci_core_drg_route_table" "rpc_drg_route_table" {
    drg_id          = oci_core_drg.drg.id
    display_name    = var.deploy
    is_ecmp_enabled = false
    import_drg_route_distribution_id = oci_core_drg_route_distribution.drg_rt_distri.id
}
resource "oci_core_drg_route_distribution" "drg_rt_distri" {
    drg_id = oci_core_drg.drg.id
    distribution_type = "IMPORT"
    display_name = "route_distribution_${var.deploy}"

}
resource "oci_core_drg_route_distribution_statement" "rpc_st_1" {
    drg_route_distribution_id = oci_core_drg_route_distribution.drg_rt_distri.id
    action = "ACCEPT"
    priority = "1"
    match_criteria {
        attachment_type   = "REMOTE_PEERING_CONNECTION"
        drg_attachment_id = ""
        match_type        = "DRG_ATTACHMENT_TYPE"
    }
}
