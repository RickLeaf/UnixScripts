#!/bin/sh

print_last_arg () {
if [ "$#" -gt 0 ]
  then
    s=$(( $# - 1 ))
  else
    s=0
  fi
  shift "$s"
  echo "$1"
}

print_last_arg "$@"
