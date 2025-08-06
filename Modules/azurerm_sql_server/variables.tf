variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
  
}
variable "resource_group_name" {
  description = "Name of the resource group where the SQL Server will be created"
  type        = string  
  
}
variable "location" {
  description = "Location where the SQL Server will be created"
  type        = string  
  
}
variable "administrator_login" {
  description = "Administrator login for the SQL Server"
  type        = string  
  
}
variable "administrator_login_password" {   
  description = "Administrator login password for the SQL Server"
  type        = string

  
}
variable "key_vault_name" {
  description = "Name of the Key Vault where secrets are stored"
  type        = string  
  
}

variable "secret_name_db" {
  description = "Name of the secret for the SQL Server administrator login"
  type        = string  
  
}

variable "secret_code_db" {
  description = "Name of the secret for the SQL Server administrator password"
  type        = string  
  
}

