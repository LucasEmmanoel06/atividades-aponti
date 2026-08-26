provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "Meu_Bucket" {
    bucket = "teste-aponti"
}

