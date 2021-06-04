resource "oci_core_remote_peering_connection" "ash_rpc" {
  for_each       = var.ash_rpc_list
  compartment_id = var.target_compartment
  drg_id         = var.ash_drg_id
  display_name   = "ash-${each.key}"
  peer_id = (
    each.key == "phx" ? (var.phx_ash_id) : (
      each.key == "gru" ? (var.gru_ash_id) : (
        each.key == "scl" ? (var.scl_ash_id) : (
          each.key == "vcp" ? (var.vcp_ash_id) : null
        )
      )
    )
  )
  peer_region_name = (
    each.key == "phx" ? ("us-phoenix-1") : (
      each.key == "gru" ? "sa-saopaulo-1" : (
        each.key == "scl" ? "sa-santiago-1" : (
          each.key == "vcp" ? "sa-vinhedo-1" : null
        )
      )
    )
  )
  lifecycle {
    ignore_changes = [
      peering_status,
      defined_tags
    ]
  }
}
