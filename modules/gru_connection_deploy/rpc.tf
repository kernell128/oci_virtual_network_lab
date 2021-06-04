resource "oci_core_remote_peering_connection" "gru_rpc" {
  for_each       = var.gru_rpc_list
  compartment_id = var.target_compartment
  drg_id         = var.gru_drg_id
  display_name   = "gru-${each.key}"
  lifecycle {
    ignore_changes = [
      peering_status,
      defined_tags
    ]
  }
}

output "gru_ash_id" {
  value = oci_core_remote_peering_connection.gru_rpc["ash"].id
}
