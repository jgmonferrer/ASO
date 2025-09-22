#!/bin/bash
for ((i=0;i<=10;i++)); do
	mult=$(( $1 * $i ))
	echo "$1 x $i = $mult"
done
