# NimFormattedFile

A brand-new version of [NewFormattedFile](https://github.com/oliversandli/NewFormattedFile), re-written in [Nim](https://nim-lang.org/).

## About

### Description

`nff` creates a new file with the format specified by its matching config file. For example, a file ending in `.py` will be created with the contents of `nff`'s `py.conf`. The `*.conf` files are simply plain text. You can create any `*.conf` files for any file types you like, as long as the config file's name matches the file extension of the target file type (`hpp.conf` for `*.hpp` files, etc.)

### Why Nim?

Nim has become a very powerful, clean, and efficient language. It combines run-time speed with ease of development; I was able to write, from scratch, NimFormattedFile in one day, while NewFormattedFile took 3-4 days. Nim deserves to be used more widely-- and in an effort to further this cause, I have re-written NewFormattedFile in Nim, with an exciting roadmap of new features to come.

## Getting Started

NimFormattedFile works as a drop-in replacement to the old NewFormattedFile.

### Prerequisites

- [Nim](https://nim-lang.org/)

The easiest way to install Nim is to use [choosenim](https://github.com/dom96/choosenim#choosenim).

### Installation

1. Clone this repo.
```bash
git clone https://github.com/oliversandli/NimFormattedFile.git
```
2. `cd` into the cloned directory and run `install.sh`.
```bash
cd nimformattedfile
chmod +x install.sh  # IMPORTANT. Give the script executable permissions.
./install.sh
```

### Uninstallation

Run the provided uninstall script.
```bash
chmod +x uninstall.sh
./uninstall.sh
```

### Build From Source

1. Clone this repo.
```bash
git clone https://github.com/oliversandli/NimFormattedFile.git
```
2. Enter the directory, and compile `nff`.
```bash
cd nimformattedfile
nim c -d:release nff.nim
```
3. Copy the executable to `/usr/local/bin`.
4. If you have never installed any version of `nff` before, create the config directory in your default config directory (`$XDG_CONFIG_HOME` or `$HOME/.config`) and copy the `templates` folder there.
```bash
mkdir ~/.config/nff
cp templates ~/.config/nff
```
Otherwise, if you have previously installed `nff`, the C++ or Nim version, copy any `.conf` files you may not have to your `templates` folder.

## Roadmap

See the [wiki](https://github.com/oliversandli/NimFormattedFile/wiki) for the roadmap.

## License

This project uses the [MIT License](https://github.com/oliversandli/NimFormattedFile/blob/master/LICENSE).

## Contact

Raise an Issue! I'll see you there.

Project link: [https://github.com/oliversandli/NimFormattedFile](https://github.com/oliversandli/NimFormattedFile)

