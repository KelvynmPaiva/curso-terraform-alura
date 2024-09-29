module "aws-dev" {
  source = "../../infra"
  instancia = "t2.micro"
  regiao_aws = "us-east-1"
  chave = "iac-dev"
  nome_instancia_tag = "VM DESENVOLVIMENTO"
  grupoDeseguranca = "security_group_desenvolvimento"
}

output "IP" {
  value = module.aws-dev.IP_publico
}