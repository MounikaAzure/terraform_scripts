provider "azurerm" {
  features {

  }

}

resource "azurerm_resource_group" "rgs" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.rgs.name
  location                 = azurerm_resource_group.rgs.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}