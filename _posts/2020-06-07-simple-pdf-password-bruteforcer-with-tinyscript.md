---
layout: post
title: Building a Simple PDF Password Bruteforcer with Tinyscript
subtitle: Quick scripting using Tinyscript for building a bruteforcer tailored to PDF password cracking
---

Our script simply consists of 4 parts:
- Shebang + imports
- Metadata
- Business logic
- Script's arguments and business logic invocation

[Tinyscript](/python/tinycript) provides a straightforward function for password cracking ; `bruteforce`, taking a maximum length, an alphabet and a minimum length (optional) as arguments.

[PyPDF2](https://pypi.org/project/PyPDF2/) allows to easily handle PDF file read while providing a password for decryption. If this decryption fails, invoking a method like `.getNumPages()` on the `reader` object will raise an exception. This way, we can simply make a business logic function testing passwords using `bruteforce(...)` according to parametrized arguments.

This gives [this short script](https://gist.github.com/dhondta/efe84a92e4dfae3b6c14932c73ab2577).


```session
$ pdf-password-bruteforce --help
PdfPasswordBruteforce 
Author   : Alexandre D'Hondt (alexandre.dhondt@gmail.com)

usage: pdf-password-bruteforce [-a ALPHABET] [-l LENGTH] [-h] [--help] [--stats] [--timings] [-v] file

positional arguments:
  file  encrypted PDF file

optional arguments:
  -a ALPHABET, --alphabet ALPHABET
                        alphabet to be used for bruteforce (default: 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%%&\'()*+,-./:;<=>?@[\\]^_`{|}~ \t\n\r\x0b\x0c)
  -l LENGTH, --length LENGTH
                        password length (default: 8)

extra arguments:
  -h             show usage message and exit
  --help         show this help message and exit
  -v, --verbose  verbose mode (default: False)

timing arguments:
  --stats    display execution time stats at exit (default: False)
  --timings  display time stats during execution (default: False)

Usage example:
  pdf-password-bruteforce secret.pdf -a xyzZ1 -l 5 -v

```
