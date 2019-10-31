#!/bin/bash

set -e

for d in [0-9]-*
do
    ( cd "$d" && ./exercise.sh )
done
