data "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  
}

data "azurerm_subnet" "fesubnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  
}

data "azurerm_key_vault" "tijori" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
  
}

data "azurerm_key_vault_secret" "vm-username" {
  name         = var.secret_name
  key_vault_id = data.azurerm_key_vault.tijori.id
  
}
data "azurerm_key_vault_secret" "vm-password" {
  name         = var.secret_code
  key_vault_id = data.azurerm_key_vault.tijori.id
  
}