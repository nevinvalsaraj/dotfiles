#!/bin/bash

files=(~/Pictures/Wallpapers/*)
feh --bg-scale ${files[RANDOM % ${#files[@]}]}
