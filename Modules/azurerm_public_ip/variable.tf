variable "public_ip_name" {
  description = "Public IP address for the VM"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the public IP will be created"
  type        = string
  
}

variable "location" {
  description = "Location where the public IP will be created"
  type        = string  

  
}

variable "allocation_method" {
  description = "Allocation method for the public IP address (Static or Dynamic)"
  type        = string
  
}