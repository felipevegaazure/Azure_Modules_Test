resource "azurerm_subnet" "snet" {
  address_prefixes     = ["${var.cidr_snet}"]
  name                 = var.snet_name
  resource_group_name  = var.snet_rg
  virtual_network_name = var.vnet_name
}