#!/bin/bash
# Укажите ваш сетевой интерфейс (например, eth0, wlan0)
INTERFACE="wlp2s0"
# Получаем текущие данные о трафике
RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
 # Ждем 1 секунду
sleep 1
# Получаем новые данные о трафике
RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
# Вычисляем скорость в байтах в секунду
RXBPS=$((RX2 - RX1))
TXBPS=$((TX2 - TX1))
# Преобразуем байты в килобайты
RXKBPS=$(echo "scale=2; $RXBPS / 1024" | bc)
TXKBPS=$(echo "scale=2; $TXBPS / 1024" | bc)
echo "Текущая скорость загрузки: $RXKBPS KB/s"
echo "Текущая скорость отдачи: $TXKBPS KB/s"

