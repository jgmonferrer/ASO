#!/bin/bash
tar -zcf "$(date --rfc-3339=date) $1.tar.gz" $1
