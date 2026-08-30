# Arquivo de valores das variáveis Terraform para Azure
# Este arquivo sobrescreve os valores padrão definidos em variables.tf
# Use este arquivo para customizar o deployment sem modificar variables.tf

# Localização dos recursos - use uma das regiões válidas
location = "brazilsouth"

# Nome do Resource Group
resource_group_name = "rg-aponti-terraform"

# Nome da Storage Account (deve ser único globalmente)
# Dica: adicione um sufixo aleatório ao nome para garantir unicidade
storage_account_name = "storageeaponti001"

# Ambiente de deployment
environment = "dev"
