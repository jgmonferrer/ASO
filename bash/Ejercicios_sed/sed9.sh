#!/bin/bash
cat /var/log/syslog | grep error | sed -n '1, 5p'
