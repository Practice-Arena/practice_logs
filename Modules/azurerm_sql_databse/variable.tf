variable "sql_database_name" {
  description = "Name of the SQL Database"
  type        = string
  
}


variable "sql_server_name" {
  description = "Name of the SQL Server where the database will be created"
  type        = string
  
}
variable "resource_group_name" {
  description = "Name of the resource group where the SQL Database will be created"
  type        = string  
  
}
