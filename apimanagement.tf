resource "azurerm_api_management" "apiManagement" {
  name                = "afsAPIManagementPOC"
  location            = "${azurerm_resource_group.genericRG.location}"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"
  publisher_name      = "AFS POC"
  publisher_email     = "marcelo.zambrana@microsoft.com"

  sku {
    name     = "Developer"
    capacity = 1
  }
  
  tags = "${var.tags}"
}