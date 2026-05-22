resource "twc_ssh_key" "main-server-ssh-key" {
  name = "main-server-ssh-key"
  body = file("../../global/ssh/main-server-ssh-key.pub")
}

resource "twc_ssh_key" "argocd-node-server-ssh-key" {
  name = "argocd-node-server-ssh-key"
  body = file("../../global/ssh/argocd-node-server.pub")
}