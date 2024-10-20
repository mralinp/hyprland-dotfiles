#!/bin/bash

# Store the result of the awk command in a variable
keymap=$(hyprctl devices | awk '/Keyboard/,/main: yes/ {if (/active keymap:/) keymap=$3} /main: yes/ {print keymap; exit}')

# Print the keymap
echo $keymap