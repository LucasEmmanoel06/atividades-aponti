# Data Source: Informações do Resource Group
# Consulta dados de um Resource Group existente no Azure
# Útil para referenciar grupos de recursos pré-existentes em outras stacks Terraform
# Exemplo de uso: referenciar um RG existente em outro módulo

# data "azurerm_resource_group" "existing_rg" {
  # Descomente e atualize o nome se quiser referenciar um RG existente:
  # name = "nome-do-rg-existente"
  
  # Para este exemplo, deixei comentado pois estamos criando um novo RG
  # Com esse data source comentado, usaremos apenas o recurso criado em main.tf (azurerm_resource_group.rg_aponti)
# }

# Data Source: Regiões disponíveis no Azure
# Retorna lista de todas as regiões disponíveis para provisionamento de recursos
# Útil para validar ou descobrir regiões supportadas
data "azurerm_locations" "available" {
  # Este data source fornece informações sobre localidades disponíveis
  # Pode ser usado para validações adicionais em variáveis
}