terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region  = var.regiao_aws
}

resource "aws_launche_template" "maquina" {
  image_id           = "ami-0e86e20dae9224db8"
  instance_type = var.instancia
  key_name = var.chave

  tags = {
    Name = var.nome_instancia_tag
  }

  security_group_name = [ var.grupoDeseguranca ]
}

resource "aws_key_pair" "chaveSSH" {
  key_name = var.chave
  public_key = file("${var.chave}.pub")
} 

output "IP_publico" {
  value = aws_instance.app_server.public_ip
}