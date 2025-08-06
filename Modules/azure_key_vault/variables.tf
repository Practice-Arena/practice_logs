variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
  
}


variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string
  
}
variable "secret_name" {
  description = "The name of the secret to be stored in the Key Vault."
  type        = string  
  
}
variable "secret_value" {
  description = "The value of the secret to be stored in the Key Vault."
  type        = string
  sensitive   = true    
  
}

variable "secret_code" {
  description = "The name of the secret code to be stored in the Key Vault."
  type        = string
  
}

variable "secret_codevalue" {
  description = "The value of the secret code to be stored in the Key Vault."
  type        = string
  sensitive   = true
  
}


variable "resource_group_location" {

    type = string
    description = "location of the resource group"
  
}

variable "secret_code_db" {
  description = "The name of the secret code for the SQL Database to be stored in the Key Vault."
  type        = string
  
}
variable "secret_name_db" {
  description = "The name of the secret for the SQL Database to be stored in the Key Vault."
  type        = string
  
}
variable "secret_codevalue_db" {  
  description = "The value of the secret code for the SQL Database to be stored in the Key Vault."
  type        = string
  sensitive   = true
  
}
variable "secret_value_db" {
  description = "The value of the secret for the SQL Database to be stored in the Key Vault."
  type        = string
  sensitive   = true
  
  
}
