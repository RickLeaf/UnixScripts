function rmoldest {
  shoptnow=$(shopt -p nullglob)
  shopt -s nullglob
  tstamp=$(date +%s)
  file=
  dir=$1
  dir=${dir:-.}

  for f in "$dir"/*
  do
    if [ ! -d "$f" ]
    then
      y=$(stat -c "%Y" "$f")
      if [ $y -lt $tstamp ]
      then
        file="$f"
        tstamp=$y
      fi
    fi
  done
  $shoptnow
  if [ -n "$file" ]
  then
    /bin/rm -i "$file"
  fi
}
