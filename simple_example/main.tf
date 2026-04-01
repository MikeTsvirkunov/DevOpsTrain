# Указываем провайдера
terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 0.13"
}

# Указываем переменные
# variable "twc_access_token" {
#   description = "Ключ доступа к Time web cloud"
#   type = string
#   sensitive = true  # Не выведится в логи
# }

# Добавляем проект MMM
data "twc_projects" "mmm_project" {
  name = "МММ"
}

data "twc_configurator" "configurator" {
  location = "ru-1"
  preset_type = "standard"
}

data "twc_os" "os" {
  name = "ubuntu"
  version = "22.04"
}

resource "twc_server" "example-server" {
  name = "Example server"
  project_id = data.twc_projects.mmm_project.id
  os_id = data.twc_os.os.id

  configuration {
    configurator_id = data.twc_configurator.configurator.id
    disk = 5120 * 4
    cpu = 1
    ram = 1024
  }
}
