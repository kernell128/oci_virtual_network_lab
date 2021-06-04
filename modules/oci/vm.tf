resource "oci_core_instance" "vm" {
    availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")
    compartment_id = var.target_compartment
    shape = var.instance_shape
    dynamic "shape_config" {
        for_each = var.shape_config == null ? [] :  tolist([var.shape_config])
        content {
            memory_in_gbs   = shape_config.value.memory_in_gbs
            ocpus           = shape_config.value.ocpus
        }
    }
    create_vnic_details {
        subnet_id = oci_core_subnet.dmz.id
        assign_public_ip = "true"
        display_name = "vm-${var.deploy}"
        hostname_label = "vm${var.deploy}"
        skip_source_dest_check = "false"
    }
    display_name = "vm-${var.deploy}"
     metadata = {
        ssh_authorized_keys = var.ssh_public_key
        //user_data = base64encode(file(var.http_custom_bootstrap_file_name))
    }
    source_details {
        source_id = lookup(data.oci_core_images.ol_7.images[0],"id")
        source_type = "image"
    }
    preserve_boot_volume = false
}
