#!/bin/bash
# complile IEEE journel paper
# w/ make index for bibliography

function make_paper {
  pdflatex $paper
  bibtex $paper
  pdflatex $paper
  pdflatex $paper
  # uncomment to clean all auzillary files 
  # latexmk -c $paper
}


make_paper;
# xdg-open "$paper$PDF"
