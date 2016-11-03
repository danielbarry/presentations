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
  run_cmd "git remote add origin git@github.com:danielbarry/test.git"
}

# test4()
#
# Runs the test.
function test4 {
  run_cmd "git status"
}

# test5()
#
# Runs the test.
function test5 {
  run_cmd "echo -e '#ReadMe\n\nHello World.' > readme.md"
}

# test6()
#
# Runs the test.
function test6 {
  run_cmd "git status"
}

# test7()
#
# Runs the test.
function test7 {
  run_cmd "git add readme.md"
}

# test8()
#
# Runs the test.
function test8 {
  run_cmd "git status"
}

# test9()
#
# Runs the test.
function test9 {
  run_cmd "git commit -m 'First commit'"
}

# test10()
#
# Runs the test.
function test10 {
  run_cmd "git fetch"
}

# test11()
#
# Runs the test.
function test11 {
  run_cmd "git push origin master"
}

# main()
#
# The main directory to run the various tests.
function main {
  # Create the environment
  create_env
  # Run the tests
  test1 &> ../out/test1.txt
  test2 &> ../out/test2.txt
  test3 &> ../out/test3.txt
  # NOTE: Here we sneakily wipe the history completely.
  git config --global push.default matching
  git fetch
  git pull origin master
  git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch *' --prune-empty --tag-name-filter cat -- --all
  git push origin --force --all
  test4 &> ../out/test4.txt
  test5 &> ../out/test5.txt
  test6 &> ../out/test6.txt
  test7 &> ../out/test7.txt
  test8 &> ../out/test8.txt
  test9 &> ../out/test9.txt
  test10 &> ../out/test10.txt
  test11 &> ../out/test11.txt
  # Remove the environment
  remove_env
  # Compile and view presentation
  pdflatex presentation.tex
  evince presentation.pdf
}

# Run the main function
main
