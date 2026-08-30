# Exibe o ID único do Resource Group criado no Azure
output "resource_group_id" {
  value       = azurerm_resource_group.rg_aponti.id
  description = "ID único do Resource Group"
}

# Exibe o nome do Resource Group criado
output "resource_group_name" {
  value       = azurerm_resource_group.rg_aponti.name
  description = "Nome do Resource Group"
}

# Exibe o ID único da Storage Account provisionada
output "storage_account_id" {
  value       = azurerm_storage_account.storage_aponti.id
  description = "ID único da Storage Account"
}

# Exibe o nome da Storage Account criada
output "storage_account_name" {
  value       = azurerm_storage_account.storage_aponti.name
  description = "Nome da Storage Account"
}

# Exibe o endpoint primário da Storage Account
# URL de acesso ao blob storage para operações de leitura/escrita
output "storage_account_primary_blob_endpoint" {
  value       = azurerm_storage_account.storage_aponti.primary_blob_endpoint
  description = "Endpoint primário do Blob Storage"
}

# Exibe a região geográfica onde os recursos foram provisionados
output "location" {
  value       = azurerm_resource_group.rg_aponti.location
  description = "Localização/Região dos recursos no Azure"
}