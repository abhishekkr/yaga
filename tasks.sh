#!/usr/bin/env bash

lint(){
  flutter analyze $(dirname $0)/lib/
}

run(){
  flutter run
}

build(){
  flutter build
}

case $1 in
  -r)
    run
    ;;
  -b)
    build
    ;;
  -l)
    lint
    ;;
  -h)
    echo "syntax: $0 -r|-b|-l|-h"
    echo "above switches are for run/build/lint/help respectively"
    ;;
  **)
    echo "non-supported task"
    $0 -h
    exit 123
    ;;
esac
