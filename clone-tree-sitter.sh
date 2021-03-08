#!/usr/bin/env bash

dir=vendor/tree-sitter

[[ -d $dir ]] && [[ -n "$(ls $dir)" ]] && exit
./git-clone-commit.sh https://github.com/tree-sitter/tree-sitter.git 2f28a35e1b118e17ab2fb6236a24c7b557e3c8a9 $dir
