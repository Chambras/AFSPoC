resource "azurerm_eventhub_namespace" "eventHubNameSpace" {
  name                = "afsEventHuBNameSpacePOC"
  location            = "${azurerm_resource_group.genericRG.location}"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"
  sku                 = "Standard"
  capacity            = 2

  # kafka_enabled = "true"

  tags = "${var.tags}"
}

resource "azurerm_eventhub" "bulkEventHub" {
  name                = "afsBulkEventHubPOC"
  namespace_name      = "${azurerm_eventhub_namespace.eventHubNameSpace.name}"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub" "liveEventHub" {
  name                = "afsLiveEventHubPOC"
  namespace_name      = "${azurerm_eventhub_namespace.eventHubNameSpace.name}"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"
  partition_count     = 2
  message_retention   = 1
}
