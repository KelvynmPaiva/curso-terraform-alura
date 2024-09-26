module "aws-dev" {
  source = "../../infra"
  instancia = "t2.micro"
  regiao_aws = "us-east-1"
  chave = "iac-dev"
  nome_instancia_tag = "VM DESENVOLVIMENTO"
}

output "IP" {
  value = module.aws-dev.IP_publico
}