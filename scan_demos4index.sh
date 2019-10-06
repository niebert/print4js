#!/bin/bash

SED_CMD="sed"
ROOT="./docs/"
MODULE="print4js"
MODNAME="Print4JS"
#DOMAIN="https://niehausbert.gitlab.io/$MODULE/"
DOMAIN="https://niebert.github.io/$MODULE/"
#REPO="https://www.gitlab.com/niehausbert/$MODULE"
REPO="https://www.github.com/niebert/$MODULE"
WIKIVERSITY="https://en.wikiversity.org/wiki/AppLSAC/Print"
OUTPUT="${ROOT}index.html"
NOW=$(date +"%Y/%m/%d")
### sed command - sed differs on OSX
### if you want to use this script on OSX install GNU sed with "brew install gsed"
### OSX
SED_CMD="gsed"
echo "<HTML>\n\t<HEAD>\n\t\t<TITLE>Demo Files LoadFile4DOM</TITLE>" > $OUTPUT
echo "\n<link href=\"css/main.css\" rel=\"stylesheet\">" >> $OUTPUT
# echo "\n<STYLE>" >> $OUTPUT
# echo "\n body { font-family: Helvetica, Arial, Geneva, sans-serif; }" >> $OUTPUT
# echo "\n</STYLE>" >> $OUTPUT
echo "\n\t<BODY>" >> $OUTPUT
echo "<H2>Demo Files for $MODNAME</H2>" >> $OUTPUT
echo "<H3>Last Update: ${NOW}</H3>" >> $OUTPUT
echo "This file contains all demo files for <a href='$DOMAIN' target='_blank'>$MODNAME</a> as learning resources for <a href='$WIKIVERSITY' target='_blank'>AppLSAC in Wikiversity</a>." >> $OUTPUT
echo "Click on the link to display the demo files." >> $OUTPUT
i=0
#echo "<UL>" >> $OUTPUT
filepath="$ROOT"
#for filepath in `find "$ROOT" -maxdepth 1 -mindepth 1 -type d| sort`; do
#  path=`basename "$filepath"`
#  if [ "$path" = ".git" ]
#	then
#	echo "WARNING: Ignore '.git' folder for $OUTPUT"
#  else
#  	echo "DIR: $path"
#  	echo "  <LI><b><a href='$DOMAIN/wiki/$path' target='_blank'>$path</a></b></LI>" >> $OUTPUT
  	echo "  <UL class=\"demolist\">" >> $OUTPUT
  	echo "Filepath: $filepath"
  	rm "${filepath}/.DS_Store"
  	for i in `find "$filepath" -maxdepth 1 -mindepth 1 -type f| sort`; do
    	file=`basename "$i"`
    	if [ "$file" = "index.html" ]
			then
			echo "- WARNING: Ignore self-reference to 'index.html' file for $OUTPUT"
  		else
    	   	title=`cat $i | $SED_CMD -n 's/<title>\(.*\)<\/title>/\1/Ip' | $SED_CMD -e 's/^[ \t]*//'`
        	## GNU: cat docs/index.html | sed -n 's/<title>\(.*\)<\/title>/\1/Ip'`
        	## OSX: cat docs/index.html | gsed -n 's/<title>\(.*\)<\/title>/\1/Ip'`
        	echo "- FILE:  '$file'"
        	echo "  TITLE: '$title' "
  			echo "    <LI><a href=\"$file\">$title</a></LI>" >> $OUTPUT
        fi
  	done
    echo "  </UL>" >> $OUTPUT
    echo "  <HR>" >> $OUTPUT
    echo "  Demo files scanned with <i>$0</i> on ${NOW}" >> $OUTPUT
    echo "  The file <i>${OUTPUT}</i> is used as <i>index.html</i> for <a href='${DOMAIN}' target='_blank'>${DOMAIN}</a>" >> $OUTPUT
    echo "  <HR>" >> $OUTPUT
    echo "  <CENTER> <a href=\"${REPO}\" target=\"_blank\">GitLab-Respository ${MODULE}</CENTER>" >> $OUTPUT
    echo "  <HR>" >> $OUTPUT
#  fi
# done
# echo "</UL>" >> $OUTPUT
echo "</BODY>" >> $OUTPUT
echo "</HTML>" >> $OUTPUT
