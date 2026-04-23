output "main_server_ip" {
  value = twc_server_ip.main-server-ipv4.ip
    depends_on  = [twc_server_ip.main-server-ipv4]
}

output "argocd_node_ip" {
  value = twc_server_ip.argocd-node-server-ipv4.ip
  depends_on  = [twc_server_ip.argocd-node-server-ipv4]
}
