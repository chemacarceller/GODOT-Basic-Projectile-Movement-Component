#!/bin/sh
echo -ne '\033c\033]0;BPRMC-Demo\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/BPRMC.run" "$@"
