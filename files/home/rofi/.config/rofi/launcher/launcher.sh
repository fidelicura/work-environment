#!/usr/bin/env bash



dir="$HOME/.config/rofi/launcher/"
theme='launcher'



rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
