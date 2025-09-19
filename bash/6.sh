#!/bin/bash
read -p "Escriba una palabra, se añadirá al archivo lista.txt: " palabra
echo $palabra >> lista.txt
