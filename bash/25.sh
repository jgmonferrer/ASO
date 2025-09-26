#!/bin/bash
echo "Últimos inicios de sesión en usuarios mediante IP:"
last | grep -E '(([0-9]?){2}[0-9]\.){3}([0-9]?){2}[0-9]'
