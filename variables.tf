variable "location" {
  type = "string"
  default = "eastus"
  description = "Location where the resoruces are going to be created."
}

variable "rgName" {
    type = "string"
    default = "accentureFederalPOCRG"
    description = "Resource Group Name."
}

variable "tags" {
  type = "map"
  default = {
    "Environment" = "Dev"
    "Project" = "AFSPoC"
    "BillingCode" = "Internal"
  }
}
