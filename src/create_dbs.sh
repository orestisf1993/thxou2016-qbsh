#!/bin/bash
set -x
set -e
# Create pickle DBs (non-normalized)
# Assuming that this script is run from /src folder.
# This script will use every *.wav and *.mid file it can find recursively in this directory.
# This is supposed to be ran once, as non-normalized PV extraction is a standard procedure, also requires a lot of time

# Delete previous pitch vector files.
# Note: xargs -0 seems to be faster than find -exec since there are a lot of files.
find . \( -iname "*.pv" -o -iname "*.mpv" -o -iname "*.npv" \) -print0 | xargs -0 rm -f

# Create the '.pickle' file without normalization for *.mid files.
find . \( -iname "*.mid" -o -iname "*.midi" \) -print0 | xargs -0 ./pitch_vectors.py midi-extract --pickle --pickle-database "./midi.pickle"

# Create the '.pickle' file without normalization for *.wav files.
find . -iname "*.wav" -print0 | xargs -0 ./pitch_vectors.py wav-extract --pickle --pickle-database "./wave.pickle"