# Hexdumper written in D-Lang

## Usage:

`dhex /path/to/file`

## Installation:

```
git clone https://github.com/leonardlorenz/dlang-hexdump.git
cd dlang-hexdump
make 
sudo make install
```

## Example:

`dhex testfile.txt`

```
69 6D 70 6F 72 74 20 73 74 64 2E 73 74 64 69 6F 3B  A 69 6D 70 6F 72 74       import.std.stdio;.import
20 73 74 64 2E 66 69 6C 65 3B  A 69 6D 70 6F 72 74 20 73 74 64 2E 73 74       .std.file;.import.std.st
72 69 6E 67 3B  A  A 73 74 72 69 6E 67 20 49 4E 50 55 54 5F 50 41 54 48       ring;..string.INPUT_PATH
...
...
...
```
