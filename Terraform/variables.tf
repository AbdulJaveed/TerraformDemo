# variables.tf
variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "East US"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "The admin username for the VM."
  type        = string
  sensitive   = true
  default     = "adminuser"
}
