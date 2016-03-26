function ls {
  _ls_longlimit=10
  _ls_cutoff=50
  declare -a _ls_files

  [ ! -t 1 ] && { command ls "$@"; return; }
  # TODO: skip past any "-rtxyz" options
  if [ $# -eq 0 ]
  then
    _ls_files=(*)
  else
    for a in "$@"
    do
      if [ -d "$a" ]
      then
        # add "${a}/*" to array
        _ls_files+=("${a}"/*)
      else
        # add $a to array
        _ls_files+=("$a")
      fi
    done
  fi
  if [ ${#_ls_files[@]} -le $_ls_longlimit ]
  then
    command ls -ld "${_ls_files[@]}"
  else
    # -1 because arrays are 0-based
    command ls -d "${_ls_files[@]:0:_ls_cutoff - 1}"
  fi
  if [ ${#_ls_files[@]} -gt $_ls_cutoff ]
  then
    echo $((${#_ls_files[@]} - _ls_cutoff)) more entries
  fi
}
