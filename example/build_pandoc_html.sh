#!/bin/bash

# Filenames
MD="${1}"
HTML="${1%.*}.html"

# Location of javascript files
JAVASCRIPT="/Users/grosskc/Documents/Computing/Presenting/"

# Link to javascript libraries
ln -fs "${JAVASCRIPT}" ./

pandoc ${MD} --filter mathjax-pandoc-filter --output ${HTML} --to html5 --from markdown --section-divs --highlight-style ./Presenting/pandoc/AFIT.theme --css ./Presenting/pandoc/AFIT.css --standalone --self-contained
