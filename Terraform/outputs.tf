# outputs.tf
output "resource_group_name" {
  value = azurerm_resource_group.myrg.name
}

output "vm_private_ip" {
  value = azurerm_network_interface.mynic.private_ip_address
}
