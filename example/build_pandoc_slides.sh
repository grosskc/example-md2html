#!/bin/bash

# Filenames
MD="${1}"
HTML="${1%.*}.html"
PDF="${1%.*}.pdf"

# Location of javascript files
JAVASCRIPT="/Users/grosskc/Documents/Computing/Presenting/"

# Link to javascript libraries
ln -fs "${JAVASCRIPT}" ./

# Convert to stand-alone slideshow
# pandoc ${MD} --filter mathjax-pandoc-filter --output ${HTML} --to html5 --from markdown --standalone --self-contained -t revealjs -V revealjs-url=./Presenting/reveal.js/ --css ./Presenting/reveal.js/css/theme/AFIT_reveal.css

pandoc ${MD} --filter mathjax-pandoc-filter --output ${HTML} --to html5 --from markdown --standalone --self-contained -t revealjs -V revealjs-url=./Presenting/reveal.js/

# Build PDF from HTML slideshow
decktape reveal --size 1024x768 --pause 50 ${HTML} ${PDF}
