resource "azurerm_network_interface" "nic" {
  location            = var.location
  name                = var.nic_name
  resource_group_name = var.rg_nic
  ip_configuration {
    name                          = var.ip_name
    private_ip_address_allocation = var.allocation
    subnet_id = ("${var.subnet_id}")
    public_ip_address_id = var.pip_id
  }
}