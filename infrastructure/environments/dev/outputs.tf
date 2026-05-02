output "main_server_ip" {
  value = twc_server_ip.main-server-ipv4.ip
    depends_on  = [twc_server_ip.main-server-ipv4]
}

output "argocd_node_ip" {
  value = twc_server_ip.argocd-node-server-ipv4.ip
  depends_on  = [twc_server_ip.argocd-node-server-ipv4]
}


output "main_server_root_pw" {
  value = twc_server.main-server.root_pass
  depends_on  = [twc_server.main-server]
  sensitive = true
}

output "argocd_node_server_root_pw" {
  value = twc_server.argocd-node-server.root_pass
  depends_on  = [twc_server.argocd-node-server]
  sensitive = true
}