---
layout: post
title: Transforming a Flat Script to a Tool with Tinyscript
subtitle: Quick adaptation of a script found on GitHub in a tool based on Tinyscript for allowing to easily reuse it later
---

During a pentest engagement addressing a Pickle vulnerability, I found a [Gist](https://gist.githubusercontent.com/BGrewell/ba619281070cc6185d81e32791a2289e/raw/fb63ce7aec76b2bf3313cae0333d1603d183550b/rotten_pickle.py) for making rotten Pickles. I decided to turn it into a Tinyscript tool for later reuse in other engagements.

The transformation gives this new [Gist](https://gist.githubusercontent.com/dhondta/0224d42a6f9dde00247ff8646f4e89aa/raw/fe4ead4981f099fcbaf5d1dddbbfec48c6b76ed9/evil-pickle-maker.py).


```session
$ evil-pickle-maker --help
EvilPickleMaker 
Author   : Alexandre D'Hondt (alexandre.dhondt@gmail.com)
Reference: https://gist.githubusercontent.com/BGrewell/ba619281070cc6185d81e32791a2289e/raw/fb63ce7aec76b2bf3313cae0333d1603d183550b/rotten_pickle.py

This tool is a Tinyscript wrapper for the aforementioned Gist.
This script creates a reverse shell that will be executed when the python pickle package attempts to unpickle it.
It can pickle any python code and execute it on the target when it is unpickled as long as the target has whatever
 modules you try to import. This code base64 encodes the python code so that it can be passed around as ASCII/Unicode
 text. It optionally URL encodes it so that it can be submitted through webforms ect.
 
Important note: With Python3, you could experience the following error: "ValueError: bad marshal data (unknown type code)"
		In this case, execute "sudo find / -name '*.pyc' -delete" to remove all pre-compiled Python files and retry.

usage: evil-pickle-maker [-a APPEND] [-l LINE_ENDINGS] [-u] [-h] [--help] [-v] ip port

positional arguments:
  ip    attacker's IP address
  port  attacker's port number

optional arguments:
  -a APPEND, --append APPEND
                        custom text (or instructions) to include (default: )
                         NB: this can be useful for bypassing filtering on web inputs
  -l LINE_ENDINGS, --line-endings LINE_ENDINGS
                        characters to use for line endings (default: \n)
                         NB: if these don't match the target you can get weird import errors
  -u, --url-encode      URL encode the resulting payload (default: False)

extra arguments:
  -h             show usage message and exit
  --help         show this help message and exit
  -v, --verbose  verbose mode (default: False)

```
