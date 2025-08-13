# Instalando o Nginx no Ubuntu

Primeiro atualizei a lista de pacotes disponíveis, com o comando:

```apt update```

Agora faço a instalação do pacote do nginx através:

```apt-get install nginx```

Podemos verificar se os serviço está funcionado pelo comando:
```systemctl status nginx```

<img width="1222" height="513" alt="image" src="https://github.com/user-attachments/assets/2f8704af-ba46-4683-b946-9ab9c38fe505" />

Se estiver active em cor verde está funcionando.

Eu abri o navegador, como estou no windows uso o google chrome e coloquei o endereço http://localhost:80, se não for tenta http://localhost:8080.

<img width="732" height="329" alt="nginxdefaultpage" src="https://github.com/user-attachments/assets/ae1feade-7096-4683-8703-6e427791c873" />

Fiz a configuração da página web pelo nano com o comando.
```nano /etc/nginx/sites-avaliable/meusite```

<img width="1147" height="743" alt="image" src="https://github.com/user-attachments/assets/9d5c62a9-f86d-45ec-a0fb-b4de4b81f331" />

**server{}** Define um bloco de servidor virtual, tudo dentro desse bloco se aplica ao nosso site.

**listen 80;** Diz ao servidor para ouvir conexões na porta 80(padrão HTTP).

**server_name localhost;** Define o dominio do nosso site, como que ele será acessado **http://localhost/**

**root /var/www/meusite;** Define o diretório raiz do site, onde o nginx vai puxar o arquivo para carregar a página.

Depois a criei a pasta "meusite". ```mkdir /var/www/meusite```. 

Em seguida criei o arquivo nano ```nano /var/www/meusite/index.html``` e criei meu html do site.

Dei permissões e mudei o dono do **/var/www/meusite** para permitir que o nginx leia os arquivos.

```chown -R www-data:www-data /var/www/meusite```

```chmod -R 755 /var/www/meusite```

**-R** é uma flag recursiva, ele faz o chown aplicar as mudanças de dono em todos os arquivos e subdiretórios.

Criei um link simbólico

```ln -s /etc/nginx/sites-available/meusite /etc/nginx/sites-enabled/```

Testei a configuração.

```nginx -t```

Com tudo ok, dei um sinal(-s) de reiniciamento a nginx para subir a página.

```nginx -s reload```

Só acessar o http://localhost e visualizar página web.







