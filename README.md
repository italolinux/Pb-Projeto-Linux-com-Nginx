# Pb-Projeto-Linux-com-Nginx
Este projeto implementa uma infraestrutura web básica com monitoramento automatizado para garantir alta disponibilidade de uma aplicação.

[1.Preparando o Ambiente](https://github.com/italolinux/Pb-Projeto-Linux-com-Nginx/blob/main/Preparando%20o%20Ambiente.md)

[2. Instalando e Configurando o Nginx](https://github.com/italolinux/Pb-Projeto-Linux-com-Nginx/blob/main/Instalando%20e%20Configurando%20o%20Nginx.md)

[3. Script de monitoramento](https://github.com/italolinux/Pb-Projeto-Linux-com-Nginx/blob/main/monitor_nginx.sh)

[4.Explicando o script de monitoramento](https://github.com/italolinux/Pb-Projeto-Linux-com-Nginx/blob/main/Monitoramento%20Nginx.md)

[5. Página web](https://github.com/italolinux/Pb-Projeto-Linux-com-Nginx/blob/main/index.html)


# Teste do monitoramento

Vou parar o serviço nginx através ```systemctl stop nginx```

<img width="956" height="582" alt="image" src="https://github.com/user-attachments/assets/f7f17523-ae3b-495d-9f45-8fd213a7501e" />


<img width="958" height="483" alt="image" src="https://github.com/user-attachments/assets/dce30101-baac-4ab1-ba10-119a80de0c88" />

O script vai detectar a queda do serviço e alertará no discord.

<img width="672" height="267" alt="image" src="https://github.com/user-attachments/assets/d8b6acbe-ed0d-4fdf-8561-2cb02d6e67ad" />

Iniciará o reiniciamento e o serviço volta a funcionar.

<img width="931" height="636" alt="image" src="https://github.com/user-attachments/assets/216bf5a4-61a9-4139-b33f-56765f0eae0c" />


<img width="1896" height="1016" alt="image" src="https://github.com/user-attachments/assets/a1da9353-c21d-408b-8068-c943949265c0" />



