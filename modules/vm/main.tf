resource "azurerm_windows_virtual_machine" "vm" {
  admin_password        = var.pass
  admin_username        = var.user
  location              = var.location
  name                  = var.vm_name
  network_interface_ids = ["${var.nic_id}"]
  resource_group_name   = var.rg_vm
  size                  = var.vm_size
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}