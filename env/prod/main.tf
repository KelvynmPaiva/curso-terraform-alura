module "aws-prod" {
  source             = "../../infra"
  instancia          = "t2.micro"
  regiao_aws         = "us-east-1"
  chave              = "iac-prod"
  nome_instancia_tag = "VM PRODUÇÃO"
  grupoDeseguranca   = "security_group_producao"
  # Infra Elastica 
  minimo    = 1
  maximo    = 10
  nomeGrupo = "Prod"
}