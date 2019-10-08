#!/bin/bash

SED_CMD="sed"
ROOT="./docs/"
MODULE="print4js"
MODNAME="Print4JS"
#DOMAIN="https://niehausbert.gitlab.io/$MODULE/"
DOMAIN="https://niebert.github.io/$MODULE/"
#REPO="https://www.gitlab.com/niehausbert/$MODULE"
REPO="https://www.github.com/niebert/$MODULE"
WIKIVERSITY="https://en.wikiversity.org/wiki/AppLSAC"
OUTPUT="./src/readme/demos.md"
NOW=$(date +"%d.%m.%Y")
### sed command - sed differs on OSX
### if you want to use this script on OSX install GNU sed with "brew install gsed"
### OSX
SED_CMD="gsed"
echo " " > $OUTPUT
echo "## Demo Files $MODNAME" >> $OUTPUT
echo "Demo files scanned with \`scan_demos4readme.sh\` - Last Update: ${NOW}" >> $OUTPUT
echo "Generated file \`${OUTPUT}\` was included into \`README.md\` after calling \`npm run build\` " >> $OUTPUT
i=0
filepath="$ROOT"
#for filepath in `find "$ROOT" -maxdepth 1 -mindepth 1 -type d| sort`; do
#  path=`basename "$filepath"`
#  if [ "$path" = ".git" ]
#	then
#	echo "WARNING: Ignore '.git' folder for $OUTPUT"
#  else
#  	echo "DIR: $path"
#  	echo "  <LI><b><a href='$DOMAIN/wiki/$path' target='_blank'>$path</a></b></LI>" >> $OUTPUT
  	echo "Filepath: $filepath"
  	rm "${filepath}/.DS_Store"
  	for i in `find "$filepath" -maxdepth 1 -mindepth 1 -type f| sort`; do
    	file=`basename "$i"`
    	if [ "$file" = "index.html" ]
			then
			echo "- WARNING: Ignore self-reference to 'index.html' file for $OUTPUT"
  		else
        if [ "$file" = "print_win.html" ]
        then
        echo "- WARNING: Ignore 'print_win.html' file for $OUTPUT"
        else
    	   	title=`cat $i | $SED_CMD -n 's/<title>\(.*\)<\/title>/\1/Ip' | $SED_CMD -e 's/^[ \t]*//'`
        	## GNU: cat docs/index.html | sed -n 's/<title>\(.*\)<\/title>/\1/Ip'`
        	## OSX: cat docs/index.html | gsed -n 's/<title>\(.*\)<\/title>/\1/Ip'`
          echo "- FILE:  '$file'"
        	echo "  TITLE: '$title' "
  			  echo "* [$title](${DOMAIN}$file)" >> $OUTPUT
        fi
      fi
  	done
#  fi
# done
echo "For further information see [Wikiversity](${WIKIVERSITY})" >> $OUTPUT
echo " " >> $OUTPUT
