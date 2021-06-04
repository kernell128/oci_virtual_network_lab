data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}
data "oci_core_images" "ol_7" {
  compartment_id = var.tenancy_ocid
  #display_name = "${var.image_display_name}"
  operating_system = "Oracle Linux"
  shape            = var.instance_shape
  #operating_system_version = "7"
  #state = "${var.image_state}"
}
