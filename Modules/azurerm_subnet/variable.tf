variable "subnet_name" {
    type        = string
    description = "Name of the subnet"
  
}
variable "resource_group_name" {
    type        = string
    description = "Name of the resource group where the subnet will be created"
  
}
variable "virtual_network_name" {
    type        = string
    description = "Name of the virtual network where the subnet will be created"
  
}
variable "address_prefixes" {
    type        = list(string)
    description = "Address prefixes for the subnet"
  
}
