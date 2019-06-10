terraform {
  backend "remote" {
    organization = "chambras"

    workspaces {
      name = "work-AccentureFederalPOC"
    }
  }
}

provider "azurerm" {
  version = "=1.30.1"
}
resource "azurerm_resource_group" "genericRG" {
  name = "${var.rgName}"
  location = "${var.location}"
  tags = "${var.tags}"
}
