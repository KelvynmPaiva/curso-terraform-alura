# Descrição do Projeto

Este projeto não se classifica como avançado, mas também não se limita a um exercício de aprendizado. O foco principal é o desenvolvimento de infraestrutura utilizando **Terraform** e **Ansible**, empregando o provedor da **AWS**. A iniciativa visa proporcionar uma compreensão prática e integrada dessas ferramentas, facilitando a automação e o gerenciamento eficiente de recursos em ambientes de nuvem.

## Execução do Projeto

Para rodar o projeto, siga os passos abaixo:

1. **Rodar o Ansible**:

   Execute o seguinte comando para aplicar o playbook:

   ```bash
   ansible-playbook playbook.yml -u ubuntu --private-key [chave-de-acesso] -i hosts.yml

1. **Rodar o executor Django**:
    Execute esse comando dentro do diretorio: /home/ubuntu/tcc:

   ```bash
   python manage.py runserver 0.0.0.0:8000