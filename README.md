---
title: Building stand-alone HTML files with images and math using pandoc and MathJax
author: Kevin Gross
date: 20-Jan-2019
---

# Install dependencies

## Pandoc
Read about [pandoc](https://pandoc.org).

Get an installer [here](https://github.com/jgm/pandoc/releases).

## MathJax javascript library

Install a local copy of the [MathJax](https://www.mathjax.org) library.

```bash
npm install -g mathjax-node
npm install -g mathjax-node-cli
npm install -g mathjax-pandoc-filter
```

Minimal test script to see if embedding math into html via pandoc is working:

```bash
echo '$$a_i$$' | pandoc --filter mathjax-pandoc-filter -s -t html5 -o test.html
```

[NPM ref](https://www.npmjs.com/package/mathjax-pandoc-filter)
[Github ref](https://github.com/lierdakil/mathjax-pandoc-filter)

# Minimal working example

Save the following markdown example as `test.md`

```
---
title: Minimal working example
author: Anonymous
---

# Heading

Some text.

## Sub-Heading

Some text with inline math: $E = m c^2$, followed by a display equation.

$$f(x) = \int_{-\infty}^x e^{t} dt$$

## Now some images

![PNG Image](test.png)

![SVG Image](test.png)
```

Now compile it to a stand-alone HTML file using the AFIT.css file to style the HTML.

```bash
pandoc test.md --filter mathjax-pandoc-filter --output test.html --to html5 --from markdown --standalone --self-contained --css AFIT.css
```

The images and style file are embedded in the HTML file.
