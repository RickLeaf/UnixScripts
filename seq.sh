#!/usr/bin/ksh

start=1
end=1
step=1

case $# in
        0)
                echo Usage: $0 '[Start [Step]] End'
                exit 0
                ;;
        1)
                end=$1
                ;;
        2)
                start=$1
                end=$2
                ;;
        3)
                start=$1
                step=$2
                end=$3
                ;;
esac

# quick & dirty validations
if [ $step -eq 0 ]
then
  exit 1
fi

if [ $step -gt 0 ]
then
  if [ $start -gt $end ]
  then
    exit 2
  fi
else
  if [ $start -lt $end ]
  then
    exit 3
  fi
fi
i=$start
if [ $step -gt 0 ]
then
  while [ $i -le $end ]
  do
    printf "%d\n" $i
    (( i += $step ))
  done
else
  while [ $i -ge $end ]
  do
    printf "%d\n" $i
    (( i += $step ))
  done
fi
