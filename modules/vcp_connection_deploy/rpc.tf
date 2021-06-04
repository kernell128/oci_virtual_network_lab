resource "oci_core_remote_peering_connection" "vcp_rpc" {
  for_each       = var.vcp_rpc_list
  compartment_id = var.target_compartment
  drg_id         = var.vcp_drg_id
  display_name   = "vcp-${each.key}"
  //peer_id          = oci_core_remote_peering_connection.acceptor.id
  lifecycle {
    ignore_changes = [
      peering_status,
      defined_tags
    ]
  }
}

output "vcp_ash_id" {
  value = oci_core_remote_peering_connection.vcp_rpc["ash"].id
}