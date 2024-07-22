resource "random_password" "password" {
  count   = 3
  length  = 16
  special = true
}

output "admin_passwords" {
  value     = [for i in random_password.password : i.result]
  sensitive = true
}
