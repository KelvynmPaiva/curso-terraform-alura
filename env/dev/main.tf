module "aws-dev" {
  source = "../../infra"
  instancia = "t2.micro"
  regiao_aws = "us-east-1"
  chave = "iac-dev"
  nome_instancia_tag = "VM DESENVOLVIMENTO"
  grupoDeseguranca = "security_group_desenvolvimento"

  minimo = 0
  maximo = 1
  nomeGrupo = "dev"
}