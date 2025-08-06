data "azurerm_key_vault" "tijori" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
  
}

data "azurerm_key_vault_secret" "db-username" {
  name         = var.secret_name_db
  key_vault_id = data.azurerm_key_vault.tijori.id
  
}
data "azurerm_key_vault_secret" "db-password" {
  name         = var.secret_code_db
  key_vault_id = data.azurerm_key_vault.tijori.id
  
}