resource "azurerm_databricks_workspace" "databricksWorkSpace" {
  name                = "afsDataBricks"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"
  location            = "${azurerm_resource_group.genericRG.location}"
  sku                 = "standard"

  tags = "${var.tags}"
}