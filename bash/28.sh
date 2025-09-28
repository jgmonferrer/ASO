#!/bin/bash
ip address show eth0 | egrep 'inet.*.brd' | cut -d " " -f 6,8
