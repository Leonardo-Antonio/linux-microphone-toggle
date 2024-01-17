#!/bin/bash

# Toggle del micrófono

# Encuentra el control de captura del micrófono
capture_control=$(amixer scontrols | grep -o -m 1 "Capture")

if [ -n "$capture_control" ]; then
    # Obtiene el estado actual del micrófono
    capture_status=$(amixer get "$capture_control" | grep -o "\[on\]")

    # Toggle del micrófono
    if [ -n "$capture_status" ]; then
        amixer set "$capture_control" nocap
        echo "Micrófono apagado"
    else
        amixer set "$capture_control" cap
        echo "Micrófono encendido"
    fi
else
    echo "No se encontró un control de micrófono."
fi

