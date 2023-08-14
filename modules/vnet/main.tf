resource "azurerm_virtual_network" "vnet" {
  address_space       = ["${var.cidr_vnet}"]
  location            = var.location
  name                = var.vnet_name
  resource_group_name = var.vnet_rg
}
