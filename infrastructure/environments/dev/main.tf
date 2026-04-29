

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
  
  # provisioner "file" {
  #   source      = "scripts/install-k3s-agent.sh"
  #   destination = "/tmp/install-k3s-agent.sh"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/install-k3s-agent.sh",
  #     "sudo /tmp/install-k3s-agent.sh \"${aws_instance.k3s_server.private_ip}\" \"${var.private_key}\""
  #   ]
  # }


  provisioner "creating-devuser" {
    inline = [
      "adduser devuser",
      "usermod -aG sudo devuser"
    ]
  }
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

  # provisioner "file" {
  #   source      = "scripts/install-k3s-server.sh"
  #   destination = "/tmp/install-k3s-server.sh"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/install-k3s-server.sh",
  #     "sudo /tmp/install-k3s-server.sh"
  #   ]
  # }

  provisioner "creating-devuser" {
    inline = [
      "adduser devuser",
      "usermod -aG sudo devuser"
    ]
  }
}
