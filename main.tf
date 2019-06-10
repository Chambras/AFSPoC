## If you want to use remote state which is recommended.
## create new accont here: https://app.terraform.io/
## or user Azure remote state using Storage accounts and DynamoDB Tables
## https://www.terraform.io/docs/backends/types/azurerm.html


# terraform {
#   backend "remote" {
#     organization = "<<Terraform organization>>"

#     workspaces {
#       name = "<<terraform workspace>>"
#     }
#   }
# }

provider "azurerm" {
  version = "=1.30.1"
}
resource "azurerm_resource_group" "genericRG" {
  name = "${var.rgName}"
  location = "${var.location}"
  tags = "${var.tags}"
}
