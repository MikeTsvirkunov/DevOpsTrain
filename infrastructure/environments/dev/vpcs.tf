resource "twc_vpc" "main-vpc" {
  name        = "Main VPC"
  description = "Tut moglabi bit vasha reclama"
  subnet_v4   = "192.168.0.0/24"
  location    = "ru-1"
}