# NimFormattedFile

This is a brand-new version of [NewFormattedFile](https://github.com/oliversandli/NewFormattedFile), re-written in [Nim](https://nim-lang.org/).

## About

### Description

`nff` creates a new file with the format specified by its matching config file. For example, a file ending in `.py` will be created with the contents of `nff`'s `py.conf`. The `*.conf` files are simply plain text. You can create any `*.conf` files for any file types you like, as long as the config file's name matches the file extension of the target file type (`hpp.conf` for `*.hpp` files, etc.)

### Why Nim?

Nim has become a very powerful, clean, and efficient language. It combines run-time speed with ease of development; I was able to write, from scratch, NimFormattedFile in one day, while NewFormattedFile took 3-4 days. Nim deserves to be used more widely-- and in an effort to further this cause, I have re-written NewFormattedFile in Nim, with an exciting roadmap of new features to come.

## Installation

NimFormattedFile works as a drop-in replacement to the old NewFormattedFile.

Automated installation is in the works. For now, you can install it manually.

1. Download and install Nim. (The easiest way is to use [choosenim](https://github.com/dom96/choosenim#choosenim).)
2. Clone this repo.
```bash
git clone https://github.com/oliversandli/NimFormattedFile.git
```
3. Enter the directory, and compile `nff`.
```bash
cd nimformattedfile
nim c -d:release nff.nim
```
4. Copy the executable to `/usr/local/bin`.
5. If you have never installed any version of `nff` before, create the config directory in your default config directory (`$XDG_CONFIG_HOME` or `$HOME/.config`) and copy the `templates` folder there.
```bash
mkdir ~/.config/nff
cp templates ~/.config/nff
```
Otherwise, if you have previously installed `nff`, the C++ or Nim version, copy any `.conf` files you may not have to your `templates` folder.

## Uninstallation (?)

1. Remove the `nff` executable.
```bash
rm /usr/local/bin/nff
```
2. Remove the `~/.config/nff` directory. BE WARNED: the command below is the fastest way, but it `f`orces `r`ecursive deletion, so use it at your own risk.
```bash
rm -rf ~/.config/nff
```

