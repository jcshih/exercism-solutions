#!/bin/sh

MODULE=$1

cd ${0%/*}/$MODULE &&
        erlc $MODULE*.erl &&
        erl -noshell -eval "eunit:test($MODULE, [verbose])" -s init stop
