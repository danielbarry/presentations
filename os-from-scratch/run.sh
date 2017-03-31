#!/bin/bash

pandoc --self-contained --standalone --toc --number-sections --section-divs -c style.css -o output.html book.md
wkhtmltopdf -B 4cm -T 4cm -L 1.5cm -R 1.5cm --minimum-font-size 16 -s A5 -l output.html os-from-scratch-$(date "+%d-%m-%Y").pdf
