resource "oci_core_cpe" "wonka_cpe" {
  compartment_id = var.target_compartment
  ip_address     = var.cpe_ip_address
  display_name   = "wonka_cpe_${var.deploy}"
}
