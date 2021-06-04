resource "oci_core_internet_gateway" "igw" {
    compartment_id  = var.target_compartment
    vcn_id          = oci_core_vcn.vcns.id
    display_name    = "igw"
}
