resource "azurerm_public_ip" "ipPublic" {
  count               = 3
  name                = "ipPublic-public-ip${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
}

output "vm_private_ips" {
  value = azurerm_linux_virtual_machine.virtualMachine[*].private_ip_address
}

