import os
import parseopt

var parser = initOptParser()
if paramCount() != 1:
  echo "Error: nff takes 1 argument, but ", paramCount(), " were given."
  quit(1)

# define flags and options
type
  ProgramState = object
    help_flag: bool
    version_flag: bool
    output_file: string

var program_state = ProgramState(help_flag: false, 
                                 version_flag: false, 
                                 output_file: "")

# parse flags and options
for kind, key, val in parser.getopt():
  case kind
  of cmdEnd: break
  # options
  of cmdShortOption, cmdLongOption:
    if val == "":
      case key
      of "h", "help":
        program_state.help_flag = true
      of "v", "version":
        program_state.version_flag = true
      else:
        echo "Error: invalid option '", key, "'"
        break
    else:
      echo "Error: invalid option '", key, "', = '", val, "'"
      break
  # arguments
  of cmdArgument:
    program_state.output_file = key

# output results
if program_state.help_flag:
  echo """NimFormattedFile v0.0.0
Create a new file designated by the input file extension.
options:
    -h --help  ask for help"""
elif program_state.version_flag:
  echo "NimFormattedFile v0.0.0"
elif program_state.output_file != "":
  echo "output_file  = ", program_state.output_file

