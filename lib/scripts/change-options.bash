#!/bin/bash

#================================================================================
# change-options.bash - Changes the orientation and language options in the ../../metadata.typ file
# usage:
#

# Parameters
type=draft
language=en
usage='Usage: change-options.bash [-t [draft|final]] [-l [fr|de|en]] [-h]'
while getopts 't:l:h' options; do
  case $options in
    t ) type=$OPTARG;;
    l ) language=$OPTARG;;
    h ) echo -e $usage
          exit 1;;
    * ) echo -e $usage
          exit 1;;
  esac
done

# Folder location
# OS specifics
if [[ "$OSTYPE" == "darwin"* ]]; then
  base_directory="$(dirname "$(greadlink -f "$0")")"
elif [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "cygwin" || "$OSTYPE" == "mysys" ]]; then
  base_directory="$(dirname "$(readlink -f "$0")")"
else
  base_directory="$(dirname "$(readlink -f "$0")")"
fi
base_directory="$base_directory/../../template/"
pushd "$base_directory"

SEPARATOR='--------------------------------------------------------------------------------'
INDENT='  '

#echo "$SEPARATOR"
#echo "-- ${0##*/} Started!"
#echo ""

fname="metadata.typ"
# disable all options
sed -e "s/^\  lang : \"en\",/  \/\/lang : \"en\",/g" "$fname" > "$fname.tmp" && mv "$fname.tmp" "$fname"
sed -e "s/^\  lang : \"fr\",/  \/\/lang : \"fr\",/g" "$fname" > "$fname.tmp" && mv "$fname.tmp" "$fname"
sed -e "s/^\  lang : \"de\",/  \/\/lang : \"de\",/g" "$fname" > "$fname.tmp" && mv "$fname.tmp" "$fname"
sed -e "s/^\  type : \"draft\",/  \/\/type : \"draft\",/g" "$fname" > "$fname.tmp" && mv "$fname.tmp" "$fname"
sed -e "s/^\  type : \"final\",/  \/\/type : \"final\",/g" "$fname" > "$fname.tmp" && mv "$fname.tmp" "$fname"

# enable wanted option
sed -e "s/  \/\/lang : \"$language\",/  lang : \"$language\",/g" "$fname" > "$fname.tmp" && mv "$fname.tmp" "$fname"
sed -e "s/  \/\/type : \"$type\",/  type : \"$type\",/g" "$fname" > "$fname.tmp" && mv "$fname.tmp" "$fname"

popd

#-------------------------------------------------------------------------------
# Exit
#
#echo ""
#echo "-- ${0##*/} Finished!"
#echo "$SEPARATOR"
