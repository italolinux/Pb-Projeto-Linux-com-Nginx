# Instalando o Nginx no Ubuntu

Primeiro atualizei a lista de pacotes disponíveis, com o comando:

**apt update**

Agora faço a instalação do pacote do nginx através:

**apt-get install nginx**

Podemos verificar se os serviço está funcionado pelo comando:
**systemctl status nginx** 

<img width="1222" height="513" alt="image" src="https://github.com/user-attachments/assets/2f8704af-ba46-4683-b946-9ab9c38fe505" />

Se estiver active em cor verde está funcionando.

Eu abri o navegador, como estou no windows uso o google chrome e coloquei o endereço http://localhost:80, se não for tenta http://localhost:8080.

<img width="732" height="329" alt="nginxdefaultpage" src="https://github.com/user-attachments/assets/ae1feade-7096-4683-8703-6e427791c873" />
