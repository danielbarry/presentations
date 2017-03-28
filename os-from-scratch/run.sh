#!/bin/bash

pandoc --self-contained --standalone --toc --number-sections --section-divs -c style.css -o output.html book.md
