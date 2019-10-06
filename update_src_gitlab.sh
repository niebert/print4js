#!/bin/sh
echo "-----------------------------------"
echo "--- CALL: $0"
echo "-----------------------------------"

gitlabuser="niehausbert"
githubuser="niebert"
# Source URL to download from the files:
urlpath4gitlab="https://${gitlabuser}.gitlab.io"
urlpath4github="https://${githubuser}.github.io"
urlpath="$urlpath4gitlab"
webpath="$urlpath4github"
# Append Path of Repository to source path

# --------------------------------
# Linux OS Settings
# SED: Stream EDit Call differ on GNU Linux and on MacOSX (BSD) Linux

#---GNU Linux Settings------------
#OpSys="GNU Linux"
#sed_call = "sed -i "
# --------------------------------

#---MacOSX BSD Linux Settings-----
OpSys="MacOSX - BSD Linux"
sed_call = "sed -i '' "
# --------------------------------



reponame="jsoneditor2menu"
exportvar="JSONEditor2Menu"
source="$urlpath/$reponame"
websource="$webpath/$reponame"
username="niebert"

#-- Form this GitLab repository the files are loaded
reponame4load="loadfile4dom"
exportvar4load="LoadFile4DOM"
downloadsource="$urlpath4github/$reponame4load"

#defvalue=$gitlabuser
#read -p "Enter your GitHub username for this repository?  " -i "$defvalue" gitlabuser
#defvalue=$reponame
#read -p "Enter your GitHub Repository name?  " -i "$defvalue" reponame
#defvalue=$exportvar
#read -p "Enter your Export Variable/Classname for this repository?  " -i "$defvalue" exportvar

# echo the current Operating System
echo "------------------------------------------------------"
echo "INFOMATION: Local Repository and Operating System"
echo "Operating System: $OpSys"
echo "Repository Name:            $reponame"
echo "Export Variable/Class Name: $exportvar"
echo "Git Username:               $username"
echo "------------------------------------------------------"


# wait 2 seconds to
sleeptime=2

mkdir -p dist
mkdir -p docs
mkdir -p docs/css
mkdir -p docs/js
mkdir -p docs/db
mkdir -p docs/tpl
mkdir -p docs/img
mkdir -p docs/img/icons-svg
mkdir -p docs/schema
mkdir -p src
mkdir -p src/libs
mkdir -p src/html
mkdir -p src/readme
mkdir -p src/css

# codegenerator files (RepoBase "HandleBars4Code")
wget $source/build.js  -O ./build.js
# wget $source/src/codegen.js  -O ./src/codegen.js

sleep $sleeptime

# Libs for ./src
wget $urlpath4github/jsoneditor2browserify/build/jsoneditor.min.js -O ./src/libs/jsoneditor.min.js
#wget $urlpath4github/json-editor-dorn/js/jsoneditor.min.js -O ./src/libs/jsoneditor.min.js
#wget $urlpath4github/json-editor-dorn/js/jsoneditor.js -O ./src/libs/jsoneditor.js
wget $urlpath4gitlab/LinkParam/js/linkparam.js -O ./src/libs/linkparam.js
# wget $urlpath4gitlab/LinkParam/js/linkparam.min.js -O ./src/libs/linkparam.min.js
# wget https://raw.gitlabusercontent.com/eligrey/FileSaver.js/master/src/FileSaver.js -O ./src/libs/filesaver.js
# wget https://raw.gitlabusercontent.com/eligrey/Blob.js/master/Blob.js -O ./src/libs/blob.js


sleep $sleeptime

wget $urlpath4github/json-editor-dorn/js/blob.js -O ./src/libs/blob.js
# wget https://cdn.rawgit.com/eligrey/canvas-toBlob.js/f1a01896135ab378aa5c0118eadd81da55e698d8/canvas-toBlob.js  -O ./src/libs/canvas2blob.js
wget $urlpath4github/json-editor-dorn/js/filesaver.js -O ./src/libs/filesaver.js
wget $urlpath4github/Handlebars4Code/js/handlebars4code.js -O ./src/libs/handlebars4code.js

#### NPM Files
file="package.json"
if [ -f "./$file" ]
then
	echo "NPM: Check file '$file' - found."
else
	echo "NPM: Check file '$file' - not found - try to download."
  wget "$source/$file"  -O "$file"
  echo "------------------------------------------------------"
  echo "STREAM EDITOR SED: Search/Replace in 'package.json'"
  echo "Operating System: $OpSys"
  echo "Repository Name:            $reponame"
  echo "Export Variable/Class Name: $exportvar"
  echo "GitLab Username:            $gitlabuser"
  echo "------------------------------------------------------"
  regexdef="'s/$reponame4load/$reponame/g'"
  echo "(1) $sed_call $regexdef ./$file "
  $sed_call $regexdef ./$file
  regexdef="'s/$exportvar4load/$exportvar/g'"
  echo "(2) $sed_call $regexdef ./$file "
  $sed_call $regexdef ./$file
	if [ "$username_replace" = "$gitlabuser" ]; then
    echo "GitLab Username already correct"
	else
    echo "Source Username '$gitlabuser' does NOT matche Destination username '$username_replace'"
		regexdef="'s/niebert/$gitlabuser/g'"
	  echo "(3) $sed_call $regexdef ./$file "
	  $sed_call $regexdef ./$file
	fi;
  echo "SED-Call: Search/Replace in 'package.json' DONE"
  echo "------------------------------------------------------"
  sleep $sleeptime

fi

#### CODE GENERATION src/libs src/html
file="files4build.js"
if [ -f "./$file" ]
then
	echo "CODEGEN: Check file '$file' - found."
	wget "$source/$file  -O ./file4buid_new.js"
else
	echo "CODEGEN: Check file '$file' - not found - try to download."
  wget $source/$file  -O ./$file
	sleep $sleeptime
fi

### HTML Code Generation
for filename in "body.html" "bodyheader.html" "bodytail.html" "datajson.html" "header.html" "headerlibs.html" "headerscript.html" "tail.html" "tailscript.html"
do
  echo "HTML: checking file exists or download '$filename'"
  file="./src/html/$filename"
  if [ -f "$file" ]
  then
  	echo "   Check file '$file' - found."
  else
  	echo "   Check file '$file' - not found - try to download."
    wget $source/src/html/$filename  -O $file
		sleep $sleeptime
  fi
done

### README Code Generation
for filename in "acknowledgement.md" "body.md" "browserify.md" "build_process.md" "doctoc.md" "folderdocs.md" "folderrepo.md" "handlebars4code.md" "headerintro.md" "jsonschema.md" "tail.md" "usage.md"
do
  echo "README: checking file exists or download '$filename'"
  file="./src/readme/$filename"
  if [ -f "$file" ]
  then
  	echo "   Check file '$file' - found."
  else
  	echo "   Check file '$file' - not found - try to download."
    wget $source/src/readme/$filename  -O $file
		sleep $sleeptime
  fi
done


### SRC/CSS Code Generation
for filename in "main.css"
do
  echo "CSS: checking file exists or download '$filename'"
  file="./src/css/$filename"
  if [ -f "$file" ]
  then
  	echo "   Check file '$file' - found."
  else
  	echo "   Check file '$file' - not found - try to download."
    wget $source/src/css/$filename  -O $file
		sleep $sleeptime
  fi
done

### DOCS/CSS Code Generation
for filename in "bootstrap-theme.css" "bootstrap-theme.css.map"  "bootstrap.css" "bootstrap.css.map" "font-awesome.css"
do
  echo "CSS: checking file exists or download '$filename'"
  file="./docs/css/$filename"
  if [ -f "$file" ]
  then
  	echo "   Check file '$file' - found."
  else
  	echo "   Check file '$file' - not found - try to download."
    wget $websource/css/$filename  -O $file
		sleep $sleeptime
  fi
done


### ICONS4MENU for docs/img/icons-svg
wget $urlpath4github/icons4menu/wget_icons.sh  -O ./wget_icons.#!/bin/sh
wget $urlpath4github/icons4menu/update_wget_icons.sh  -O ./update_wget_icons.#!/bin/sh

for filename in  "fa-folder-open" "fa-file-save" "gear" "fa-trash" "gear" "edit" "info" "power"
 do
  echo "ICONS: checking file exists or download '$filename'"
  for filepostfix in  "-white.svg" "-black.svg"
    do
      file="./docs/img/icons-svg/$filename$filepostfix"
      if [ -f "$file" ]
        then
  	       echo "   Check file '$file' - found."
      else
  	     echo "   Check file '$file' - not found - try to download."
         wget $urlpath4github/icons4menu/img/icons-svg/$filename$filepostfix  -O $file
		     sleep $sleeptime
      fi
  done
done
echo "---------------------------------------------------"
echo "              DOWNLOAD FINISHED"
echo "---------------------------------------------------"
echo "Operating System:           $OpSys "
echo "    in case you run the script on other Linux OS"
echo "    please edit $0 and alter SED-call."
echo "Repository Name:            $reponame"
echo "Export Variable/Class Name: $exportvar"
echo "GitLab Username:            $gitlabuser"
echo "---------------------------------------------------"
