resource "azurerm_storage_account" "dataLakeSA" {
  name                     = "afspocdatalakestorage"
  resource_group_name      = "${azurerm_resource_group.genericRG.name}"
  location                 = "${azurerm_resource_group.genericRG.location}"
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  is_hns_enabled = "true"

  network_rules {
    ip_rules                   = ["138.88.132.45"]
    virtual_network_subnet_ids = ["${azurerm_subnet.frontEndLayer.id}", "${azurerm_subnet.appLayer.id}", "${azurerm_subnet.backEndLayer.id}"]
  }

  tags = "${var.tags}"
}