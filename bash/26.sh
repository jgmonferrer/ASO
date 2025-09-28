#!/bin/bash
find $PWD -type f -exec ls -l {} \; | egrep '^.{7}rwx' >> archivos_peligrosos.txt
