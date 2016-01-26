#!/bin/sh

DIRNAME=$1
EXERCISENAME=$2
if [ -z $EXERCISENAME ]
then
    EXERCISENAME=$DIRNAME
fi

cd ${0%/*}/$DIRNAME &&
        erlc $EXERCISENAME*.erl &&
        erl -noshell -eval "eunit:test($EXERCISENAME, [verbose])" -s init stop
