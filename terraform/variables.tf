# Variables del proyecto

variable "subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
  default     = "b287eb6f-d0cf-4303-9c9a-74ff25a10104"
}

variable "location" {
  description = "Región de Azure (swedencentral obligatorio para cuenta estudiante)"
  type        = string
  default     = "swedencentral"
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "rg-casopractico2"
}

variable "acr_name" {
  description = "Nombre del Azure Container Registry (único global, solo minúsculas)"
  type        = string
  default     = "acrcp2marcojaramillo"
}

variable "vm_admin_username" {
  description = "Usuario administrador de la VM Linux"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Ruta a la clave pública SSH"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
