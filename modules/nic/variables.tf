variable "location" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "rg_nic" {
  type = string
}

variable "ip_name" {
  type = string
}

variable "allocation" {
  type = string
  default = "Dynamic"
}

variable "subnet_id" {
  type = string
}

variable "pip_id" {
  type = string
}


