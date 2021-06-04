resource "oci_core_remote_peering_connection" "scl_rpc" {
    for_each        = var.scl_rpc_list
    compartment_id  = var.target_compartment
    drg_id          = var.scl_drg_id
    display_name    = "scl-${each.key}"
    //peer_id          = oci_core_remote_peering_connection.acceptor.id
    lifecycle {
      ignore_changes = [
          peering_status,
          defined_tags
      ]
    }
}

output "scl_ash_id" {
  value = oci_core_remote_peering_connection.scl_rpc["ash"].id
}