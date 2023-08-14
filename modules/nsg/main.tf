resource "azurerm_network_security_group" "nsg" {
  location            = var.location
  name                = var.nsg_name
  resource_group_name = var.rg_nsg
  security_rule {
    name                       = "AllowRDP"
    description                = "permite el protocolo RDP por el puerto 3389"
    priority                   = 100
    direction                  = var.direction
    access                     = var.access
    protocol                   = var.protocol
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = var.source_nsg
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_snet" {
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = var.nsg_associate_snet_id
}