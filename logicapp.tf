resource "azurerm_logic_app_workflow" "logicApp" {
  name                = "afsLogicAppPOC"
  location            = "${azurerm_resource_group.genericRG.location}"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"

  tags = "${var.tags}"
}