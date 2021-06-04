
terraform {
  required_version = "0.15.4"
  required_providers {
    oci = {
      source                = "hashicorp/oci"
      version               = "~>4.28.0"
      configuration_aliases = [oci.ash]
    }
  }

}

module "onprime" {
  source             = "./modules/onprime"
  target_compartment = local.target_compartment
  pf_image_id        = local.pf_image_id
  wonka_cidr         = local.wonka_cidr
  dmz_cidr           = local.wonka_dmz_cidr
  tenancy_ocid       = local.tenancy_ocid
}

module "oci_ash" {
  source = "./modules/oci"
  providers = {
    oci = oci.ash
  }
  deploy             = "ash"
  target_compartment = local.target_compartment
  environments       = local.environments
  cidrs_map          = local.cidr_map
  tenancy_ocid       = local.tenancy_ocid
  vcn_ash_cidr       = local.vcn_ash_cidr
  vcn_phx_cidr       = local.vcn_phx_cidr
  vcn_gru_cidr       = local.vcn_gru_cidr
  vcn_vcp_cidr       = local.vcn_vcp_cidr
  vcn_scl_cidr       = local.vcn_scl_cidr
  ssh_public_key     = local.ssh_public_key
  instance_shape     = local.instance_shape
  cpe_ip_address     = module.onprime.wonka_cpe
  wonka_dmz_cidr     = local.wonka_cidr
  vpn_client_cidr    = local.vpn_client_cidr
  dynamic_rules_cidrs = [
    local.vcn_phx_cidr,
    local.vcn_gru_cidr,
    local.vcn_vcp_cidr,
    local.vcn_scl_cidr,
  ]
  shape_config = {
    ocpus         = local.e3_shape_config_ocpus
    memory_in_gbs = local.e3_shape_config_memory_in_gbs
  }
}
module "oci_phx" {
  source = "./modules/oci"
  providers = {
    oci = oci.phx
  }
  deploy             = "phx"
  target_compartment = local.target_compartment
  environments       = local.environments
  cidrs_map          = local.cidr_map
  tenancy_ocid       = local.tenancy_ocid
  vcn_ash_cidr       = local.vcn_ash_cidr
  vcn_phx_cidr       = local.vcn_phx_cidr
  vcn_gru_cidr       = local.vcn_gru_cidr
  vcn_vcp_cidr       = local.vcn_vcp_cidr
  vcn_scl_cidr       = local.vcn_scl_cidr
  ssh_public_key     = local.ssh_public_key
  instance_shape     = local.instance_shape
  cpe_ip_address     = module.onprime.wonka_cpe
  wonka_dmz_cidr     = local.wonka_cidr
  vpn_client_cidr    = local.vpn_client_cidr
  dynamic_rules_cidrs = [
    local.vcn_ash_cidr,
    local.vcn_gru_cidr,
    local.vcn_vcp_cidr,
    local.vcn_scl_cidr,
  ]
  shape_config = {
    ocpus         = local.e3_shape_config_ocpus
    memory_in_gbs = local.e3_shape_config_memory_in_gbs
  }
}
module "oci_gru" {
  source = "./modules/oci"
  providers = {
    oci = oci.gru
  }
  deploy             = "gru"
  target_compartment = local.target_compartment
  environments       = local.environments
  cidrs_map          = local.cidr_map
  tenancy_ocid       = local.tenancy_ocid
  vcn_ash_cidr       = local.vcn_ash_cidr
  vcn_phx_cidr       = local.vcn_phx_cidr
  vcn_gru_cidr       = local.vcn_gru_cidr
  vcn_vcp_cidr       = local.vcn_vcp_cidr
  vcn_scl_cidr       = local.vcn_scl_cidr
  ssh_public_key     = local.ssh_public_key
  instance_shape     = local.instance_shape
  cpe_ip_address     = module.onprime.wonka_cpe
  wonka_dmz_cidr     = local.wonka_cidr
  vpn_client_cidr    = local.vpn_client_cidr
  dynamic_rules_cidrs = [
    local.vcn_ash_cidr,
    local.vcn_phx_cidr,
    local.vcn_vcp_cidr,
    local.vcn_scl_cidr,
  ]
  shape_config = {
    ocpus         = local.e3_shape_config_ocpus
    memory_in_gbs = local.e3_shape_config_memory_in_gbs
  }
}
module "oci_vcp" {
  source = "./modules/oci"
  providers = {
    oci = oci.vcp
  }
  deploy             = "vcp"
  target_compartment = local.target_compartment
  environments       = local.environments
  cidrs_map          = local.cidr_map
  tenancy_ocid       = local.tenancy_ocid
  vcn_ash_cidr       = local.vcn_ash_cidr
  vcn_phx_cidr       = local.vcn_phx_cidr
  vcn_gru_cidr       = local.vcn_gru_cidr
  vcn_vcp_cidr       = local.vcn_vcp_cidr
  vcn_scl_cidr       = local.vcn_scl_cidr
  ssh_public_key     = local.ssh_public_key
  cpe_ip_address     = module.onprime.wonka_cpe
  wonka_dmz_cidr     = local.wonka_cidr
  vpn_client_cidr    = local.vpn_client_cidr
  instance_shape     = local.instance_standard_shape
  dynamic_rules_cidrs = [
    local.vcn_ash_cidr,
    local.vcn_phx_cidr,
    local.vcn_gru_cidr,
    local.vcn_scl_cidr,
  ]
  #
  shape_config = null
}
module "oci_scl" {
  source = "./modules/oci"
  providers = {
    oci = oci.scl
  }
  deploy             = "scl"
  target_compartment = local.target_compartment
  environments       = local.environments
  cidrs_map          = local.cidr_map
  tenancy_ocid       = local.tenancy_ocid
  vcn_ash_cidr       = local.vcn_ash_cidr
  vcn_phx_cidr       = local.vcn_phx_cidr
  vcn_gru_cidr       = local.vcn_gru_cidr
  vcn_vcp_cidr       = local.vcn_vcp_cidr
  vcn_scl_cidr       = local.vcn_scl_cidr
  ssh_public_key     = local.ssh_public_key
  instance_shape     = local.instance_shape
  wonka_dmz_cidr     = local.wonka_cidr
  vpn_client_cidr    = local.vpn_client_cidr
  cpe_ip_address     = module.onprime.wonka_cpe
  dynamic_rules_cidrs = [
    local.vcn_ash_cidr,
    local.vcn_phx_cidr,
    local.vcn_gru_cidr,
    local.vcn_vcp_cidr,
  ]
  shape_config = {
    ocpus         = local.e3_shape_config_ocpus
    memory_in_gbs = local.e3_shape_config_memory_in_gbs
  }
}

module "oci_ash_connection_deploy" {
  source = "./modules/ash_connection_deploy"
  providers = {
    oci = oci.ash
  }
  target_compartment = local.target_compartment
  environments       = local.environments
  ash_drg_id         = module.oci_ash.drg_id
  ash_rpc_list       = setsubtract(local.environments, ["ash"])
  # connectivity peer id
  phx_ash_id = module.oci_phx_connection_deploy.phx_ash_id
  gru_ash_id = module.oci_gru_connection_deploy.gru_ash_id
  scl_ash_id = module.oci_scl_connection_deploy.scl_ash_id
  vcp_ash_id = module.oci_vcp_connection_deploy.vcp_ash_id
}
module "oci_phx_connection_deploy" {
  source = "./modules/phx_connection_deploy"
  providers = {
    oci = oci.phx
  }
  target_compartment = local.target_compartment
  environments       = local.environments
  phx_drg_id         = module.oci_phx.drg_id
  phx_rpc_list       = setsubtract(local.environments, ["phx"])
}
module "oci_gru_connection_deploy" {
  source = "./modules/gru_connection_deploy"
  providers = {
    oci = oci.gru
  }
  target_compartment = local.target_compartment
  environments       = local.environments
  gru_drg_id         = module.oci_gru.drg_id
  gru_rpc_list       = setsubtract(local.environments, ["gru"])
}
module "oci_scl_connection_deploy" {
  source = "./modules/scl_connection_deploy"
  providers = {
    oci = oci.scl
  }
  target_compartment = local.target_compartment
  environments       = local.environments
  scl_drg_id         = module.oci_scl.drg_id
  scl_rpc_list       = setsubtract(local.environments, ["scl"])
}
module "oci_vcp_connection_deploy" {
  source = "./modules/vcp_connection_deploy"
  providers = {
    oci = oci.vcp
  }
  target_compartment = local.target_compartment
  environments       = local.environments
  vcp_drg_id         = module.oci_vcp.drg_id
  vcp_rpc_list       = setsubtract(local.environments, ["vcp"])
}
