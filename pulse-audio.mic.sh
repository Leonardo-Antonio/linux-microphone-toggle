mic_name="alsa_input.pci-0000_03_00.6.analog-stereo"
state=$(pacmd list-sources | grep -A 10 "$mic_name" | grep "muted" | awk '{print $2}' | tr -d '[:space:]')

echo "Estado del micrófono: $state"

if [ "$state" = "yes" ]; then
    icon="audio-input-microphone"
    action="Encendido"
else
    icon="microphone-sensitivity-muted"
    action="Apagado"
fi

pactl set-source-mute "$mic_name" toggle && notify-send -i "$icon" "Micrófono" "$action"
