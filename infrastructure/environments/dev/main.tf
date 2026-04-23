

# resource "terraform_data" "always_replace" {
#   input = timestamp()
# }

resource "twc_server" "main-server" {
  name = "Main server"
  os_id = data.twc_os.os.id
  configuration {
    configurator_id = data.twc_configurator.configurator.id
    disk = 5120 * 4
    cpu = 1
    ram = 1024
  }
  # lifecycle {
  #   replace_triggered_by = [terraform_data.always_replace.id]
  # }
  project_id = data.twc_projects.mmm-project.id
  ssh_keys_ids = [twc_ssh_key.main-server-ssh-key.id]
}

resource "twc_server" "argocd-node-server" {
  name = "ArgoCD node server"
  os_id = data.twc_os.os.id
  configuration {
    configurator_id = data.twc_configurator.configurator.id
    disk = 5120 * 4
    cpu = 1
    ram = 1024
  }
  # lifecycle {
  #   replace_triggered_by = [terraform_data.always_replace.id]
  # }
  project_id = data.twc_projects.mmm-project.id
  ssh_keys_ids = [twc_ssh_key.argocd-node-server-ssh-key.id]
}
