recurse ()
(
  recurse2 ()
  {
    [ $_recurse_stop -eq 1 ] && return
    cd "./$1" || return
    pwd ## do whatever you want in the pwd
    for entry in * .*;
    do
        [ "." = "$entry" -o ".." = "$entry" ] && continue;
        [ -d "$entry" -a ! -h "$entry" ] && recurse2 "$entry";
    done
    cd ..
  }

  _recurse_stop=0
  trap '_recurse_stop=1' 2
  recurse2 "$1"
)