# Variável: Localização dos recursos no Azure
# Define a região/localização geográfica onde os recursos serão provisionados
variable "location" {
  default     = "brazilsouth"
  description = "Localização dos recursos no Azure. Recomendado: brazilsouth para recursos no Brasil"
  type        = string

  validation {
    condition = contains(
      ["eastus", "westus", "brazilsouth", "southcentralus"],
      var.location
    )
    error_message = "Erro: A localização informada não é válida. Regiões válidas: eastus, westus, brazilsouth, southcentralus"
  }
}

# Variável: Nome do Resource Group
# O Resource Group é obrigatório no Azure e funciona como container de recursos
variable "resource_group_name" {
  default     = "rg-aponti-terraform"
  description = "Nome do Resource Group onde os recursos serão criados"
  type        = string
}

# Variável: Nome da Storage Account
# Deve conter apenas letras minúsculas e números, sem hífens
# Nome deve ser único globalmente no Azure
variable "storage_account_name" {
  default     = "storageeaponti001"
  description = "Nome da Storage Account. Deve ser único globalmente e conter apenas letras minúsculas e números"
  type        = string

  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
    error_message = "Erro: O nome da Storage Account deve ter entre 3 e 24 caracteres"
  }
}

# Variável: Ambiente
# Identifica o ambiente de deployment (desenvolvimento, teste, produção, etc.)
variable "environment" {
  default     = "dev"
  description = "Ambiente de deployment. Ex: dev, test, prod"
  type        = string
}