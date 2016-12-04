#!/usr/bin/env python

import subprocess

output = subprocess.check_output(['env', '-i', 'bash', '-c', 'set'])
baseline = output.split("\n")

output = subprocess.check_output(['env', '-i', 'bash', '-c', '. myGlobalVariables.bash; set'])
additional = output.split("\n")

# these get set when ". myGlobal..." runs and so are false positives
additional.remove("BASH_EXECUTION_STRING='. myGlobalVariables.bash; set'")
additional.remove('PIPESTATUS=([0]="0")')
additional.remove('_=myGlobalVariables.bash')
# I get an empty item at the end (blank line from subprocess?)
additional.remove('')

bash = {}
for assign in additional:
        if not assign in baseline:
                name, value = assign.split("=", 1)
                bash[name]=value
                #exec(name + '="' + value + '"')

print "New values:"
for key in bash:
  print "Key: ", key, " = ", bash[key]  
