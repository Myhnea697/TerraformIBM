resource "azurerm_linux_virtual_machine" "virtualMachine" {
  count                           = 3
  name                            = "virtualMachine-machine-${count.index}"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  admin_password                  = random_password.password[count.index].result
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.interface[count.index].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
