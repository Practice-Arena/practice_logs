module "resource_group" {
  source                  = "../Modules/azurerm_rg"
  resource_group_name     = "rg-todo"
  resource_group_location = "centralindia"
}

module "keyvault" {
  source = "../Modules/azure_key_vault"
  depends_on              = [module.resource_group]
  key_vault_name          = "babudabba1"
  resource_group_location = "centralindia"
  resource_group_name     = "rg-todo"
  secret_name             = "vm-username"
  secret_value          = "adminuser"
  secret_code             = "vm-password"
  secret_codevalue       = "lipi1234567@"
  secret_name_db          = "db-username"
  secret_value_db         = "adminuser"
  secret_codevalue_db     = "lipi1234567@"
  secret_code_db          = "db-password"

}


module "virtual_network" {
  depends_on               = [module.resource_group]
  source                   = "../Modules/azurerm_vnet"
  virtual_network_name     = "vnet-todo"
  virtual_network_location = "centralindia"
  resource_group_name      = "rg-todo"
  address_space            = ["10.0.0.0/16"]

}

module "frontend_subnet" {

  depends_on           = [module.virtual_network]
  source               = "../Modules/azurerm_subnet"
  subnet_name          = "frontend-subnet"
  resource_group_name  = "rg-todo"
  virtual_network_name = "vnet-todo"
  address_prefixes     = ["10.0.1.0/24"]

}

module "backend_subnet" {

  depends_on           = [module.virtual_network]
  source               = "../Modules/azurerm_subnet"
  subnet_name          = "backend-subnet"
  resource_group_name  = "rg-todo"
  virtual_network_name = "vnet-todo"
  address_prefixes     = ["10.0.2.0/24"]

}

module "public_ip_frontend" {
  
  depends_on = [ module.resource_group ]

  source                   = "../Modules/azurerm_public_ip"
  public_ip_name           = "todo-fe-public-ip"
  resource_group_name      = "rg-todo"
  location                 = "centralindia"
  allocation_method        = "Static"
  
}

module "frontend_vm" {
  depends_on = [ module.frontend_subnet,module.public_ip_frontend,module.keyvault ]
  source = "../Modules/azurerm_vm"
  resource_group_name = "rg-todo"
  location = "centralindia"
  vm_name = "frontend-vm"
  nic_name = "frontend-nic"
  vm_size = "Standard_B1s"
  key_vault_name = "babudabba1"
  secret_name = "vm-username"
  secret_code = "vm-password"
   image_publisher = "Canonical"
  image_offer = "0001-com-ubuntu-server-jammy"
  image_sku = "22_04-lts"
  image_version = "latest"
  public_ip_name = "todo-fe-public-ip"
  subnet_name = "frontend-subnet"
  virtual_network_name = "vnet-todo"
  nsg_name = "frontend-nsg"



  
}

module "public_ip_backend" {
  
  depends_on = [ module.resource_group ]
  source                   = "../Modules/azurerm_public_ip"
  public_ip_name           = "todo-be-public-ip"
  resource_group_name      = "rg-todo"
  location                 = "centralindia"
  allocation_method        = "Static"
  
}


module "backend_vm" {
  depends_on = [ module.backend_subnet, module.public_ip_backend,module.keyvault ]
  source = "../Modules/azurerm_vm"
  resource_group_name = "rg-todo"
  location = "centralindia"
  vm_name = "backend-vm"
  nic_name = "backend-nic"
  vm_size = "Standard_B1s"
  key_vault_name = "babudabba1"
  secret_name = "vm-username"
  secret_code = "vm-password"
  image_publisher = "Canonical"
  image_offer = "0001-com-ubuntu-server-jammy"
  image_sku = "22_04-lts"
  image_version = "latest"
  public_ip_name = "todo-be-public-ip"
  subnet_name = "backend-subnet"
  virtual_network_name = "vnet-todo"
  nsg_name = "backend-nsg"
 
}


module "sql_server" {
  source                   = "../Modules/azurerm_sql_server"
  sql_server_name          = "babuserver-todo"
  resource_group_name      = "rg-todo"
  location                 = "centralindia"
  administrator_login      = "adminuser"
  administrator_login_password = "lipi1234567@"
  key_vault_name = "babudabba1"
  secret_name_db =  "db-username"
  secret_code_db = "db-password"
  depends_on = [ module.keyvault, module.resource_group ]
}

module "sql_database" {
  depends_on = [ module.sql_server ]
  source                   = "../Modules/azurerm_sql_databse"
  sql_database_name        = "todo-database"
 
  sql_server_name = "babuserver-todo"
  resource_group_name     = "rg-todo" 

  
  

  
}