import os
import parseopt
import strutils
import system

proc confirm_extension(conf_dir: string, file_name: string): string =
  # get file_name's extension
  var ext = file_name.split('.')[^1] # MARK let change
  # generate the file path of the extention's config
  var conf_path = conf_dir & "/templates/" & ext & ".conf" # MARK let change
  if not existsFile(conf_path):
    echo "Could not find file '", conf_path
  else:
    return conf_path

proc copy_paste_conf(source_name: string, dest_name: string) =
  var source_contents = readFile(source_name) # MARK let change
  writeFile(dest_name, source_contents)

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
    -v --version  output current version
    -h --help     ask for help"""
elif program_state.version_flag:
  echo "NimFormattedFile v0.0.1"
elif program_state.output_file != "":
  var conf_dir = case existsEnv("XDG_DATA_HOME") # MARK let change
    of true: getEnv("XDG_DATA_HOME") & "/nff"
    else: getEnv("HOME") & "/.config/nff"

  var src = confirm_extension(conf_dir, program_state.output_file)
  if src != "":
    copy_paste_conf(src, program_state.output_file)

