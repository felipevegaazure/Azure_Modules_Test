resource "azurerm_public_ip" "public_ip" {
  name                = var.pip_name
  resource_group_name = var.rg_pip
  location            = var.location
  allocation_method   = var.method
}