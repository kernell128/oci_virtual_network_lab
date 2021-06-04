resource oci_core_instance pf1 {
    compartment_id = var.target_compartment
    /*
    agent_config {
        are_all_plugins_disabled = "false"
        is_management_disabled   = "false"
        is_monitoring_disabled   = "false"
    
    plugins_config {
        desired_state = "ENABLED"
        name          = "OS Management Service Agent"
        }
    plugins_config {
        desired_state = "ENABLED"
        name          = "Custom Logs Monitoring"
        }
    plugins_config {
        desired_state = "ENABLED"
        name          = "Compute Instance Run Command"
        }
    plugins_config {
        desired_state = "ENABLED"
        name          = "Compute Instance Monitoring"
        }
    }
    */
    availability_config {
        recovery_action = "RESTORE_INSTANCE"
    }
    availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")
    create_vnic_details {
        assign_public_ip = "true"
        display_name = var.virtual_network_cnf["PF1_DISPLAY_NAME"]
        hostname_label = var.virtual_network_cnf["DNS_LABEL"]
        skip_source_dest_check = "true"
        subnet_id              = oci_core_subnet.dmz.id
    }
    display_name = var.virtual_network_cnf["PF1_DISPLAY_NAME"]
    fault_domain = var.virtual_network_cnf["PF1_FT"]
  /*
    launch_options {
        boot_volume_type                    = "IDE"
        firmware                            = "BIOS"
        is_consistent_volume_naming_enabled = "false"
        is_pv_encryption_in_transit_enabled = "false"
        #network_type                        = "E1000"
        remote_data_volume_type             = "SCSI"
    }
    */
    shape = var.instance_shape
    shape_config {
    //    baseline_ocpu_utilization = ""
        memory_in_gbs             = "16"
        ocpus                     = "1"
    }
    source_details {
        source_id   = var.pf_image_id
        source_type = "image"
    }
}
