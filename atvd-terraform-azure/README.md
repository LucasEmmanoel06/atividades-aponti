# Terraform Azure - Aponti

Projeto Terraform para provisionar recursos no Microsoft Azure de forma simples e automatizada.

## 📋 Recursos Provisionados

Este projeto cria os seguintes recursos no Azure:

- **Resource Group**: Container necessário para agregar todos os recursos Azure
- **Storage Account**: Serviço de armazenamento em blob para dados

## 📁 Estrutura dos Arquivos

- **main.tf**: Define o provider Azure e os recursos principais (Resource Group e Storage Account)
- **variables.tf**: Declara as variáveis utilizadas com validações e valores padrão
- **outputs.tf**: Define as saídas que serão exibidas após a execução
- **data.tf**: Data sources para consultar informações do Azure
- **terraform.tfvars**: Arquivo com valores das variáveis (customizável)

## 🔧 Pré-requisitos

Antes de usar este projeto, você precisa:

1. Instalar [Terraform](https://www.terraform.io/downloads.html) (versão 1.0+)
2. Instalar [Azure CLI](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli)
3. Autenticar no Azure:
   ```bash
   az login
   ```

## 📝 Variáveis Disponíveis

| Variável | Padrão | Descrição |
|----------|--------|-----------|
| `location` | `brazilsouth` | Localização/região do Azure |
| `resource_group_name` | `rg-aponti-terraform` | Nome do Resource Group |
| `storage_account_name` | `storageeaponti001` | Nome da Storage Account |
| `environment` | `dev` | Ambiente de deployment |

## 🚀 Como Usar

1. **Inicializar Terraform**:
   ```bash
   terraform init
   ```

2. **Validar a configuração**:
   ```bash
   terraform validate
   ```

3. **Visualizar o plano de execução**:
   ```bash
   terraform plan
   ```

4. **Aplicar as mudanças** (criar recursos):
   ```bash
   terraform apply
   ```

5. **Destruir os recursos**:
   ```bash
   terraform destroy
   ```

## 💡 Dicas Importantes

- ✅ A localização padrão é `brazilsouth` (recomendado para Brasil)
- ✅ O nome da Storage Account deve ser único globalmente no Azure
- ✅ O Resource Group é obrigatório e agrupa todos os recursos
- ✅ Use `terraform plan` antes de `apply` para revisar as mudanças
- ✅ Customize os valores em `terraform.tfvars` conforme necessário

## 📌 Regiões Disponíveis

Regiões validadas para este projeto:
- `eastus` - Leste dos EUA
- `westus` - Oeste dos EUA
- `brazilsouth` - Brasil (Sul)
- `southcentralus` - Sul Central dos EUA