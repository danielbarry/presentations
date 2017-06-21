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
  rm -rf wrk_dir
  mkdir wrk_dir
  cd wrk_dir
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

# prep3()
#
# Prepares environment.
function prep3 {
  run_cmd 'git config --global push.default matching'
  run_cmd 'git fetch'
  run_cmd 'git pull origin master'
  run_cmd 'rm -rf *.md *.txt'
  run_cmd 'rm .git/index .git/refs/heads/master'
  run_cmd 'echo "clean" > clean.txt'
  run_cmd 'git add clean.txt'
  run_cmd 'git commit -m "-- Repo Start --"'
  run_cmd 'git branch --set-upstream-to=origin/master master'
  run_cmd 'git push origin --force --all'
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

# test12()
#
# Runs the test.
function test12 {
  run_cmd "git status"
}

# test14()
#
# Runs the test.
function test14 {
  run_cmd "echo -e '\n\nNew words' > readme.md; git status"
}

# test15()
#
# Runs the test.
function test15 {
  run_cmd "git stash"
}

# test16()
#
# Runs the test.
function test16 {
  run_cmd "git status"
}

# test17()
#
# Runs the test.
function test17 {
  run_cmd "git stash pop"
}

# prep17()
#
# Prepares environment.
function prep17 {
  run_cmd 'cp -r .git .git.old'
  run_cmd 'git stash'
  run_cmd 'echo "New data" > new.txt'
  run_cmd 'git add new.txt'
  run_cmd 'git commit -m "New data"'
  run_cmd 'git push'
  run_cmd 'git stash pop'
  run_cmd 'rm -rf .git'
  run_cmd 'mv .git.old .git'
  run_cmd 'rm new.txt'
}

# test18()
#
# Runs the test.
function test18 {
  run_cmd "git fetch"
}

# test19()
#
# Runs the test.
function test19 {
  run_cmd "git stash"
}

# test20()
#
# Runs the test.
function test20 {
  run_cmd "git pull"
}

# test21()
#
# Runs the test.
function test21 {
  run_cmd "git stash pop"
}

# test22()
#
# Runs the test.
function test22 {
  run_cmd "git checkout -b feature/new-branch"
}

# test23()
#
# Runs the test.
function test23 {
  run_cmd "git branch"
}

# test24()
#
# Runs the test.
function test24 {
  run_cmd "echo -e 'extra data' > feature.txt; git add feature.txt; git commit -m 'New commit'"
}

# prep24()
#
# Prepares environment.
function prep24 {
  run_cmd 'git push origin --delete feature/new-branch'
}

# test25()
#
# Runs the test.
function test25 {
  run_cmd "git push origin feature/new-branch"
}

# test26()
#
# Runs the test.
function test26 {
  run_cmd "git checkout master"
}

# test27()
#
# Runs the test.
function test27 {
  run_cmd "git merge feature/new-branch"
}

# test28()
#
# Runs the test.
function test28 {
  run_cmd "git status"
}

# test29()
#
# Runs the test.
function test29 {
  run_cmd "git status -s"
}

# test30()
#
# Runs the test.
function test30 {
  run_cmd "git checkout readme.md"
}

# test31()
#
# Runs the test.
function test31 {
  run_cmd "git log -n 1"
}

# test32()
#
# Runs the test.
function test32 {
  run_cmd "git reset --mixed HEAD^"
}

# test33()
#
# Runs the test.
function test33 {
  run_cmd "git log -n 1"
}

# main()
#
# The main directory to run the various tests.
function main {
  # Create the environment
  create_env
  # Run the tests
  test1 > ../out/test1.txt 2>&1
  test2 > ../out/test2.txt 2>&1
  test3 > ../out/test3.txt 2>&1
  # NOTE: Here we sneakily wipe the history completely.
  prep3 > ../out/prep3.txt 2>&1
  test4 > ../out/test4.txt 2>&1
  test5 > ../out/test5.txt 2>&1
  test6 > ../out/test6.txt 2>&1
  test7 > ../out/test7.txt 2>&1
  test8 > ../out/test8.txt 2>&1
  test9 > ../out/test9.txt 2>&1
  test10 > ../out/test10.txt 2>&1
  test11 > ../out/test11.txt 2>&1
  test12 > ../out/test12.txt 2>&1
  test14 > ../out/test14.txt 2>&1
  test15 > ../out/test15.txt 2>&1
  test16 > ../out/test16.txt 2>&1
  test17 > ../out/test17.txt 2>&1
  # NOTE: Here we sneakily push a commit and forget we did it.
  prep17 > ../out/prep17.txt 2>&1
  test18 > ../out/test18.txt 2>&1
  test19 > ../out/test19.txt 2>&1
  test20 > ../out/test20.txt 2>&1
  test21 > ../out/test21.txt 2>&1
  test22 > ../out/test22.txt 2>&1
  test23 > ../out/test23.txt 2>&1
  test24 > ../out/test24.txt 2>&1
  # NOTE: Here we sneakily delete our old branch here.
  prep24 > ../out/prep24.txt 2>&1
  test25 > ../out/test25.txt 2>&1
  test26 > ../out/test26.txt 2>&1
  test27 > ../out/test27.txt 2>&1
  test28 > ../out/test28.txt 2>&1
  test29 > ../out/test29.txt 2>&1
  test30 > ../out/test30.txt 2>&1
  test31 > ../out/test31.txt 2>&1
  test32 > ../out/test32.txt 2>&1
  test33 > ../out/test33.txt 2>&1
  # Compile and view presentation
  cd ..
  rm presentation.aux
  rm presentation.log
  rm presentation.nav
  rm presentation.out
  rm presentation.snm
  rm presentation.toc
  pdflatex presentation.tex
  evince presentation.pdf
}

# Run the main function
main
