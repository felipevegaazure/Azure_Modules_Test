variable "location" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "rg_nsg" {
  type = string
}

variable "direction" {
  type = string
  default = "Inbound"
}

variable "access" {
  type = string
  default = "Allow"
}

variable "protocol" {
  type = string
  default = "Tcp"
}

variable "source_nsg" {
  type = string
  default = "Internet"
}

variable "nsg_associate_snet_id" {
  type = string
}