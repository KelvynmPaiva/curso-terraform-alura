cd /home/ubuntu
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo python3 -m pip install ansible
tee -a playbook.yml > /dev/null <<EOT

- hosts: localhost
  tasks:
    - name: Instalando o python e virtualenv
      apt: 
        pkg: 
        - python3
        - virtualenv
        update_cache: true
      become: true # SUDO

    - name: Git  Clone
      ansible.builtin.git: 
        repo: https://github.com/alura-cursos/clientes-leo-api
        dest: /home/ubuntu/tcc
        version: master
        force: true

    - name: Instalando dependencias com pip (Django e Django Rest)
      pip:
       
        virtualenv: /home/ubuntu/tcc/venv
        requirements: /home/ubuntu/tcc/requirements.txt

    - name: Alterando os hosts do settings 
      lineinfile:
        path: /home/ubuntu/tcc/setup/settings.py
        regexp: 'ALLOWED_HOSTS'
        line: 'ALLOWED_HOSTS = ["*"]'
        backrefs: true

    - name: Instalar o setuptools
      pip:  
        name: setuptools
        virtualenv: /home/ubuntu/tcc/venv

    - name: Confirgurando o banco de dados 
      shell: '. /home/ubuntu/tcc/venv/bin/activate ; python /home/ubuntu/tcc/manage.py migrate'

    - name: Carregando dados do DB
      shell: '. /home/ubuntu/tcc/venv/bin/activate; python /home/ubuntu/tcc/manage.py loaddata clientes.json'

    - name: Iniciando Servidor 
      shell: '. /home/ubuntu/tcc/venv/bin/activate; nohup python /home/ubuntu/tcc/manage.py runserver 0.0.0.0:8000 &'
EOT
ansible-playbook playbook.yml