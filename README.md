vim-sweave-rst
==============

Vim syntax files for Sweave using Restructured Text.

Using Restructured Text for R sweave files requires the R "ascii" library.

It is very helpful to have a driver script such as the following:

```bash
#!/bin/bash
R -e "library(ascii); ReST(\"$1\")"
```
to process the rst noweb files into true restructured text (or sphinx) files.
