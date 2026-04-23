resource "twc_server_ip" "argocd-node-server-ipv4" {
  source_server_id = twc_server.argocd-node-server.id
  type = "ipv4"
}

resource "twc_server_ip" "main-server-ipv4" {
  source_server_id = twc_server.main-server.id
  type = "ipv4"
}
