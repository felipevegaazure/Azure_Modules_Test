variable "user" {
  type    = string
  default = "windadmin"
}

variable "pass" {
  type    = string
  default = "QwertyAsdf**1234567"
}

variable "rg_vm" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "nic_id" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}
