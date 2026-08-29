variable "region" {
    default = "sa-east-1"
    description = "A região que o serviço irá subir será America do Sul Leste"
    type = string
    validation {
        condition = containers([us-east-1, us-east-2, sa-east-1], var.region)
        error_message = "Erro: A região informada não é válida. As regiões válidas são: us-east-1, us-east-2, sa-east-1"
    }
}