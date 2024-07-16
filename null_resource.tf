resource "null_resource" "ping_test" {
  count      = var.vm_count
  depends_on = [azurerm_linux_virtual_machine.virtualMachine]

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "adminuser"
      password = random_password.password[count.index].result
      host     = azurerm_linux_virtual_machine.virtualMachine[count.index].public_ip_address
      timeout  = "5m"
    }

    inline = [
      "ping -c 4 ${azurerm_linux_virtual_machine.virtualMachine[(count.index + 1) % var.vm_count].public_ip_address}"
    ]
  }
  triggers = {
    always_run = "${timestamp()}"
  }

}
