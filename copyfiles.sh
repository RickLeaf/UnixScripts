function copyfiles {
  _copypastefiles=("$@")
  _copypastesrc="$PWD"
  _copypastemode=copy
}

function cutfiles {
  _copypastefiles=("$@")
  _copypastesrc="$PWD"
  _copypastemode=cut
}

function pastefiles {
  for f in "${_copypastefiles[@]}"
  do
    cp "${_copypastesrc}/$f" .
    if [[ ${_copypastemode} = "cut" ]]
    then
      rm "${_copypastesrc}/$f"
    fi
  done
}
