#!/bin/bash

cd /tmp
mkfifo FIFO > /dev/null 2>&1

start() {
  while [ 1 ]; do
    amixer set Master 100%+
    espeak -v fr "ducrot"
    espeak -v fr "grosse"
    espeak -v fr "mer2"
    amixer set Master 0%-
    sleep 10
  done;
}

start & > /dev/null 2>&1
