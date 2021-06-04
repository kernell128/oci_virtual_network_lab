resource "oci_core_remote_peering_connection" "phx_rpc" {
    //provider = oci.phx
    for_each        = var.phx_rpc_list
    compartment_id  = var.target_compartment
    drg_id          = var.phx_drg_id
    display_name    = "phx-${each.key}"
    //peer_id          = oci_core_remote_peering_connection.acceptor.id
    lifecycle {
      ignore_changes = [
          peering_status,
          defined_tags
      ]
    }
}

output "phx_ash_id" {
  value = oci_core_remote_peering_connection.phx_rpc["ash"].id
}