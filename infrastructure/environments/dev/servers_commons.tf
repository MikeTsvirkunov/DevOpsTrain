data "twc_configurator" "configurator" {
  location = "ru-1"
  preset_type = "standard"
}

data "twc_os" "os" {
  name = "ubuntu"
  version = "22.04"
}
