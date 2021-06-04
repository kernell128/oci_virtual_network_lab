resource "oci_core_vcn" "vcns" {
    compartment_id  = var.target_compartment
    cidr_block      = var.wonka_cidr 
    display_name    = var.virtual_network_cnf["DISPLAY_NAME"]
    dns_label       = var.virtual_network_cnf["DNS_LABEL"]
}