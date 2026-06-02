#!/bin/bash

NETWORK="$1"

if [ -z "$NETWORK" ]; then
    echo "Usage: $0 <network_prefix>"
    exit 1
fi

for i in {1..254}; do
    (
        IP="${NETWORK}.${i}"
        if ping -c 1 -W 1 "$IP" >/dev/null 2>&1; then
            echo "$IP"
        fi
    ) &
done

wait
