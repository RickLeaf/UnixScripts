prompt_command() {
  _PS1_now=$(date +%s)
  PS1=$( printf "\[\e[0;32m\]%02d:%02d:%02d \W>\[\e[1;37m\] " \
           $((  ( _PS1_now - _PS1_lastcmd ) / 3600))         \
           $(( (( _PS1_now - _PS1_lastcmd ) % 3600) / 60 )) \
           $((  ( _PS1_now - _PS1_lastcmd ) % 60))           \
       )
  _PS1_lastcmd=$_PS1_now
}
PROMPT_COMMAND='prompt_command'
_PS1_lastcmd=$(date +%s)