# Build the documents
pandoc -t beamer -o talk.tex talk.md
pdflatex main.tex
pdflatex main.tex
# Clean-up after ourselves
rm *.aux *.log *.nav *.out *.snm *.toc *.vrb
rm talk.tex
