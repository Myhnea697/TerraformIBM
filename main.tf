provider "azurerm" {
  features {}
}

resource "random_password" "password" {
  count   = 3
  length  = 16
  special = true
}

resource "azurerm_public_ip" "ipPublic" {
  count               = 3
  name                = "ipPublic-public-ip${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
}


output "admin_passwords" {
  value     = [for i in random_password.password : i.result]
  sensitive = true
}

output "vm_private_ips" {
  value = azurerm_linux_virtual_machine.virtualMachine[*].private_ip_address
}

