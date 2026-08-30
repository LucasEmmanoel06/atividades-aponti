# Configuração do Provider Azure
# Este bloco autentica e configura a conexão com a Azure
# O provider "azurerm" gerencia todos os recursos na plataforma Azure
provider "azurerm" {
  features {}
  # Configuração padrão do Azure Provider com recursos básicos habilitados
}

# Resource Group
# Necessário no Azure - é o container que agrupa todos os recursos
# Todos os recursos Azure precisam estar associados a um Resource Group
resource "azurerm_resource_group" "rg_aponti" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
    project = "aponti-terraform"
  }
}

# Storage Account (equivalente ao S3 da AWS)
# Neste exemplo, criamos um storage account com replicação LRS (Local Redundant Storage)
resource "azurerm_storage_account" "storage_aponti" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg_aponti.name
  location                 = azurerm_resource_group.rg_aponti.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
    project = "aponti-terraform"
  }
}

