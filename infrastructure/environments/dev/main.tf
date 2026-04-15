# Указываем провайдера
terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.4.4"
}

# Указываем переменные
# variable "twc_access_token" {
#   description = "Ключ доступа к Time web cloud"
#   type = string
#   sensitive = true  # Не выведится в логи
# }

# Добавляем проект MMM
data "twc_projects" "mmm-project" {
  name = "МММ"
}

resource "terraform_data" "always_replace" {
  input = timestamp()
}

data "twc_configurator" "configurator" {
  location = "ru-1"
  preset_type = "standard"
}

data "twc_os" "os" {
  name = "ubuntu"
  version = "22.04"
}

resource "twc_server" "main-server" {
  name = "Main server"
  os_id = data.twc_os.os.id
  configuration {
    configurator_id = data.twc_configurator.configurator.id
    disk = 5120 * 4
    cpu = 1
    ram = 1024
  }
  project_id = data.twc_projects.mmm-project.id
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
  project_id = data.twc_projects.mmm-project.id
  lifecycle {
    replace_triggered_by = [terraform_data.always_replace.id]
  }
}
