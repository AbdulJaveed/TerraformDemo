variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "East US"  # You can change this if needed
}

variable "node_count" {
  description = "The number of nodes in the Kubernetes cluster."
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The VM size for the nodes."
  type        = string
  default     = "Standard_G1"  # Updated VM size
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB."
  type        = number
  default     = 100
}
