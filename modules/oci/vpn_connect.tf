resource "oci_core_ipsec" "vpn_connect" {
  compartment_id = var.target_compartment
  cpe_id         = oci_core_cpe.wonka_cpe.id
  drg_id         = oci_core_drg.drg.id
  static_routes = [
    var.wonka_dmz_cidr,
    var.vpn_client_cidr,
  ]
  display_name = "vpn_${var.deploy}"
}
data "oci_core_ipsec_connection_tunnels" "vpn_connect" {
  ipsec_id = oci_core_ipsec.vpn_connect.id
}

/*
resource "oci_core_ipsec_connection_tunnel_management" "ipsec_connection_tunnel_management" {
    ipsec_id  = oci_core_ipsec.vpn_connect.id
    tunnel_id = lookup(data.oci_core_ipsec_connection_tunnels.vpn_connect.ip_sec_connection_tunnels[0], "id")
    bgp_session_info {
        customer_bgp_asn      = "6594628"
        customer_interface_ip = "10.255.254.127/31"
        oracle_interface_ip   = "10.255.254.126/31"
    }
    display_name = "IPSecTunnelPrimary"
    routing      = "BGP"
    ike_version = "V2"
}
*/
