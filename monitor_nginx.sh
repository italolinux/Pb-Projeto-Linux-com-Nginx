#!/bin/bash

# === CONFIGURAÇÕES ===
URL="http://localhost"  # URL do seu site
DISCORD_WEBHOOK="https://discord.com/api/webhooks/1403420961407107283/VoUo4X6PWPSA5hRc8D6K8H51vdimQ0geGzueo1DDbXgIo6LJihTsJ-Bb21-8b2LVBMIx"
LOG_FILE="/var/log/monitoramento.log"
STATE_FILE="/tmp/monitoramento_state"  # Guarda o último estado do site
HOJE=$(date '+%Y-%m-%d %H:%M:%S')

# === FUNÇÃO: Enviar mensagem para Discord ===
enviar_alerta() {
    local MENSAGEM="$1"
    curl -s -H "Content-Type: application/json" \
         -X POST \
         -d "{\"content\": \"$MENSAGEM\"}" \
         "$DISCORD_WEBHOOK" > /dev/null
}

# === VERIFICAR STATUS HTTP DO SITE ===
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# === LER ESTADO ANTERIOR ===
if [ -f "$STATE_FILE" ]; then
    ESTADO_ANTERIOR=$(cat "$STATE_FILE")
else
    ESTADO_ANTERIOR="online"
fi

# === LÓGICA DE MONITORAMENTO ===
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "$HOJE - OK - Site online (200)" >> "$LOG_FILE"
    echo "online" > "$STATE_FILE"

    # Se estava offline e voltou, avisa
    if [ "$ESTADO_ANTERIOR" = "offline" ]; then
        enviar_alerta "✅ **RECUPERADO:** O site voltou a funcionar!\nHorário: $HOJE"
    fi
else
    echo "$HOJE - ERRO - Site fora do ar - HTTP $HTTP_CODE" >> "$LOG_FILE"
    echo "offline" > "$STATE_FILE"

    # Se estava online e caiu, avisa
    if [ "$ESTADO_ANTERIOR" = "online" ]; then
        enviar_alerta "🚨 **ALERTA:** Site fora do ar!\nStatus HTTP: $HTTP_CODE\nHorário: $HOJE"
    fi

    # Reinicia o Nginx automaticamente
    systemctl restart nginx
    enviar_alerta "🔄 **AÇÃO:** Nginx reiniciado automaticamente\nHorário: $HOJE"
fi
