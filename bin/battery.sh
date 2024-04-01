#!/bin/bash

POWER=$(cat /sys/class/power_supply/BAT1/energy_now)
CAP=$(cat /sys/class/power_supply/BAT1/energy_full)

echo "scale = 2; $POWER / $CAP * 100" | bc
