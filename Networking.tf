provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  features {}
}

#Compliance Landing Zone For company, Production 
resource "azurerm_resource_group" "rg" {
  name     = "RG${var.networking}${local.production-short}"
  location = "East US"
  tags = {
    Ambiente = "${local.production}"
    Area = "${var.networking}"
    Empresa = "${local.company}"
  }
}
 
resource "azurerm_storage_account" "stg" {

  name                     = "stac${var.networking}${local.production-short}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Ambiente = "${local.production}"
    Area = "${var.networking}"
    Empresa = "${local.company}"
  }
}

#Definiendo las redes
resource "azurerm_network_security_group" "secgroup" {
  name                = "${var.networking}${local.production-short}SecutiryGroup"#  "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    Ambiente = "${local.production}"
    Area = "${var.networking}"
    Empresa = "${local.company}"
  }
}

resource "azurerm_virtual_network" "vn" {
  name                = "${var.networking}${local.production-short}VirtualNetwork"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
#  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnetGateWay"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.secgroup.id
  }

  subnet {
    name           = "subnetDns"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnetFirewall"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
    Ambiente = "${local.production}"
    Area = "${local.networking}"
    Empresa = "${local.company}"
  }
}


