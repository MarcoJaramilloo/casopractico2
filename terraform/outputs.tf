# Outputs principales del despliegue

output "acr_login_server" {
  description = "URL del registro ACR"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "Usuario admin del ACR"
  value       = azurerm_container_registry.acr.admin_username
  sensitive   = true
}

output "acr_admin_password" {
  description = "Contraseña admin del ACR"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}

output "vm_public_ip" {
  description = "IP pública de la VM con Podman"
  value       = azurerm_public_ip.vm_pip.ip_address
}

output "resource_group_name" {
  description = "Nombre del grupo de recursos"
  value       = azurerm_resource_group.rg.name
}
