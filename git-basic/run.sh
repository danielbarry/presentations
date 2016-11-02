#!/bin/bash

# Setup globals
user_dir="$(pwd)/"

# run_cmd()
#
# Run the command in the current string.
#
# @param $1 The command to be run.
function run_cmd {
  echo "\$ $1"
  eval $1 | sed "s#${user_dir}##g"
}

# create_env()
#
# Creates the environment to be worked in.
function create_env {
  rm -rf out
  mkdir out
  mkdir wrk_dir
  cd wrk_dir
}

# remove_env()
#
# Removes the environment to be worked in.
function remove_env {
  cd ..
  rm -rf wrk_dir
}

# test1()
#
# Runs the test.
function test1 {
  run_cmd "git init"
}

# test2()
#
# Runs the test.
function test2 {
  run_cmd "git fetch"
}

# test3()
#
# Runs the test.
function test3 {
  run_cmd "git status"
}

# main()
#
# The main directory to run the various tests.
function main {
  create_env
  test1 &> ../out/test1.txt
  test2 &> ../out/test2.txt
  test3 &> ../out/test3.txt
  remove_env
  pdflatex presentation.tex
  evince presentation.pdf
}

# Run the main function
main
