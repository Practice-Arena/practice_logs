variable "resource_group_name" {    
  description = "Name of the resource group where the VM will be created"
  type        = string
  
}

variable "location" {
  description = "Location where the VM will be created"
  type        = string
  
}

variable "nic_name" {
  description = "Name of the network interface for the VM"
  type        = string
  
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  
}
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  
  
}

 variable "image_publisher" {
  description = "Publisher of the VM image"
  type        = string
   
 }

 variable "image_offer" {
  description = "Offer of the VM image"
  type        = string
   
 }
 variable "image_sku" {
  description = "SKU of the VM image"
  type        = string
   
 }

 variable "image_version" {
  description = "Version of the VM image"
  type        = string
  
   
 }

 
 variable "public_ip_name" {
  description = "Name of the public IP address associated with the VM"
  type        = string
   
 }
 
variable "subnet_name" {
  description = "Name of the subnet where the VM will be deployed"
  type        = string
}
 variable "virtual_network_name" {
  description = "Name of the virtual network where the VM will be deployed"
  type        = string
   
 }

 variable "key_vault_name" {
  description = "Name of the Azure Key Vault to store secrets"
  type        = string
   
 }

 variable "secret_name" {
  description = "Name of the secret for the VM username"
  type        = string
   
 }
 variable "secret_code" {
  description = "Name of the secret for the VM password"
  type        = string
   
 }

 variable "nsg_name" {
  description = "Name of the Network Security Group (NSG) for the VM"
  type        = string
   
 }
 

