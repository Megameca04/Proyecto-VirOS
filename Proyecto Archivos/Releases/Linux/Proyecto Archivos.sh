#!/bin/sh
echo -ne '\033c\033]0;Proyecto Archivos\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Proyecto Archivos.x86_64" "$@"
