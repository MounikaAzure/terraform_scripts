provider "azurerm" {
  features {

  }

}
resource "azurerm_resource_group" "localrg" {
  name     = "tf-RG2"
  location = "East US2"
}

resource "azurerm_storage_account" "storage" {
  name                     = "devstoragetfacc2022"
  resource_group_name      = azurerm_resource_group.localrg.name
  location                 = azurerm_resource_group.localrg.location
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags = {
    environment = "development"
    team        = "dev"
  }
}