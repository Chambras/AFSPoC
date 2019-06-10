resource "azurerm_virtual_network" "genericVNet" {
  name                = "afsPOC"
  location            = "${azurerm_resource_group.genericRG.location}"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"
  address_space       = ["10.0.0.0/16"]

  tags = "${var.tags}"
}

resource "azurerm_subnet" "frontEndLayer" {
  name                 = "frontEndLayer"
  resource_group_name  = "${azurerm_resource_group.genericRG.name}"
  virtual_network_name = "${azurerm_virtual_network.genericVNet.name}"
  address_prefix       = "10.0.2.0/24"
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "appLayer" {
  name                 = "appLayer"
  resource_group_name  = "${azurerm_resource_group.genericRG.name}"
  virtual_network_name = "${azurerm_virtual_network.genericVNet.name}"
  address_prefix       = "10.0.4.0/24"
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "backEndLayer" {
  name                 = "backEndLayer"
  resource_group_name  = "${azurerm_resource_group.genericRG.name}"
  virtual_network_name = "${azurerm_virtual_network.genericVNet.name}"
  address_prefix       = "10.0.6.0/24"
  service_endpoints = ["Microsoft.Storage"]
}


resource "azurerm_network_security_group" "genericNSG" {
  name                = "RDPSSHSecurityGroup"
  location            = "${azurerm_resource_group.genericRG.location}"
  resource_group_name = "${azurerm_resource_group.genericRG.name}"

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "162.58.0.210"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "SSH"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "162.58.0.210"
    destination_address_prefix = "VirtualNetwork"
  }

  tags = "${var.tags}"
}
