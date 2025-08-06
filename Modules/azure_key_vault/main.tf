



data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "tijori" {
  name                        = var.key_vault_name
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization = true

  sku_name = "standard"

  
}

resource "azurerm_role_assignment" "key_vault_secret_access" {
  scope                = azurerm_key_vault.tijori.id
  role_definition_name = "Key Vault administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}


resource "azurerm_key_vault_secret" "vm-username" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.tijori.id
  depends_on = [ azurerm_role_assignment.key_vault_secret_access
  ]
}


resource "azurerm_key_vault_secret" "vm-password" {
  name         = var.secret_code
  value        = var.secret_codevalue
  key_vault_id = azurerm_key_vault.tijori.id
  depends_on = [ azurerm_role_assignment.key_vault_secret_access
  ]
}

resource "azurerm_key_vault_secret" "db-username" {
  name         = var.secret_name_db
  value        = var.secret_value_db
  key_vault_id = azurerm_key_vault.tijori.id
  depends_on = [ azurerm_role_assignment.key_vault_secret_access
  ]
}


resource "azurerm_key_vault_secret" "db-password" {
  name         = var.secret_code_db
  value        = var.secret_codevalue_db
  key_vault_id = azurerm_key_vault.tijori.id
  depends_on = [ azurerm_role_assignment.key_vault_secret_access
  ]
}


