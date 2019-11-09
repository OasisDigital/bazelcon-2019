#!/bin/bash

set -e

for d in [0-9]-*
do
    echo ================================================ $d
    ( cd "$d" && ./exercise.sh )
done
