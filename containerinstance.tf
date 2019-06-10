resource "azurerm_container_registry" "registry" {
  name                     = "afsContainerRegistry"
  resource_group_name      = "${azurerm_resource_group.genericRG.name}"
  location                 = "${azurerm_resource_group.genericRG.location}"
  sku                      = "Basic"
  admin_enabled            = false

  #if you need/wat geo-repplication you need premium sku
  #     georeplication_locations = ["East US", "West Europe"]
  
  tags = "${var.tags}"
}

resource "azurerm_container_group" "containerGroup" {
  name                = "afsContainerGroupPOC"
  location            = "${azurerm_resource_group.genericRG.location}"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"
  ip_address_type     = "public"
  dns_name_label      = "afsContainerPOC"
  os_type             = "Linux"
  restart_policy = "Always"

  container {
    name   = "afscontainerpoc"
    image  = "microsoft/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = "${var.tags}"
}