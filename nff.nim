import os
import strutils
import system
import tables

import clapfn

# GLOBAL VARIABLES
let version = "0.0.3"

# PROCEDURES
proc confirm_extension(conf_dir: string, file_name: string): string =
  # get file_name's extension
  var ext = file_name.split('.')[^1] # TODO: let change
  # generate the file path of the extention's config
  var conf_path = conf_dir & "/templates/" & ext & ".tmpl" # TODO: let change
  if not fileExists(conf_path):
    echo "Could not find file '", conf_path, "'"
  else:
    return conf_path

proc copy_paste_conf(source_name: string, dest_name: string) =
  var source_contents = readFile(source_name) # TODO: let change
  writeFile(dest_name, source_contents)

# MAIN PROGRAM
var parser = ArgumentParser(programName: "nff", fullName: "NimFormattedFile",
                            description: "Create a new file designated by the input file's extension.",
                            version: version)

parser.addRequiredArgument("file", "The file to create.")

let args = parser.parse()
let output_file = args["file"]

var conf_dir = case existsEnv("XDG_DATA_HOME") # TODO: let change
  of true: getEnv("XDG_DATA_HOME") & "/nff"
  else: getEnv("HOME") & "/.config/nff"

var src = confirm_extension(conf_dir, output_file)
if src != "":
  copy_paste_conf(src, output_file)

