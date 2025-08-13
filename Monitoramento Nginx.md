# Script de Monitoramento e reiniciamento do Nginx.

```#!/bin/bash``` Indica que o script deve ser executado com o interpretador Bash.

```URL=``` Variável que armazena o endereço do site a ser monitorado.

```DISCORD_WEBHOOK=``` O URL do webhook do Discord para onde as notificações serão enviadas.

```LOG_FILE=``` O caminho para o arquivo onde o histórico de monitoramento será registrado.

```STATE_FILE=``` Um arquivo temporário que o script usa para guardar o último estado do site ("online" ou "offline") e evitar o envio de alertas repetidos.

```HOJE=``` Variável que armazena a data e hora atuais para serem usadas nos logs e mensagens.

```+%Y(ano), -%m(mês), -%d(dia), %H(hora):%M(minuto):%S(segundos)```

```enviar_alerta()``` Uma função que recebe uma mensagem como argumento.

```curl``` O comando usado para enviar a mensagem para a URL do webhook do Discord.

```-s``` Oculta a barra de progresso do curl.

```-H "Content-Type: application/json" ``` Define o cabeçalho da requisição, indicando que o conteúdo é um JSON.

```-X POST``` Define o Post como método de requisição.

```-d "{\"content\": \"$MENSAGEM\"}"``` O corpo da requisição JSON, contendo a mensagem a ser enviada.

```> /dev/null``` Descarta a saída do curl, garantindo que não apareça nada no terminal.

```curl``` Novamente, usado para fazer uma requisição para a URL do site.

```-s``` Silencioso, não mostra a barra de progresso.

```-o /dev/null``` Descarta o conteúdo da página, que não é necessário para esta verificação.

```-w "%{http_code}"``` Uma opção poderosa do curl que imprime apenas o código de status HTTP da resposta. O resultado é armazenado na variável ```HTTP_CODE```.

```if [ "$HTTP_CODE" -eq 200 ]``` Se a condição for verdadeira (o código HTTP é 200), o script executa o código abaixo.

```echo "$HOJE - OK - Site online (200)" >> "$LOG_FILE"``` Adiciona uma nova linha ao arquivo de log (/var/log/monitoramento.log). Essa linha registra a data e hora, a mensagem "OK - Site online (200)", ```>>``` faz que uma nova linha seja acrescentada  no final do arquivo, sem apagar o conteúdo anterior.

```echo "online" > "$STATE_FILE"``` Grava a palavra "online" no arquivo de estado (/tmp/monitoramento_state). ```>``` acrescenta o novo estado, apagando o anterior.

Se a condição for falsa ```else``` executa os códigos.

```echo "$HOJE - ERRO - Site fora do ar - HTTP $HTTP_CODE" >> "$LOG_FILE"``` Adiciona uma nova linha ao arquivo de log, registrando a data e hora, a mensagem de erro e o código HTTP.

```echo "offline" > "$STATE_FILE"``` Atualiza o arquivo de estado com a palavra "offline", registrando que o site está inacessível.

``` if [ "$ESTADO_ANTERIOR" = "online" ]; then``` verifica o estado.

```enviar_alerta "🚨 **ALERTA:** Site fora do ar!\nStatus HTTP: $HTTP_CODE\nHorário: $HOJE"``` envia alerta pelo discord com a mensagem acima

```systemctl restart nginx``` reinicia o serviço do nginx.

```enviar_alerta "🔄 **AÇÃO:** Nginx reiniciado automaticamente\nHorário: $HOJE"``` envia outro alerta avisando o reiniciamento do serviço.



