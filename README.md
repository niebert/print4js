# Print4JS
`Print4JS` is a A tiny javascript library to help printing from the web.
## Print4JS - Print Page for JavaScript
This repository is a basically fork of [`print.js`](https://github.com/crabbly/Print.js) by [Rodrigo Vieira](https://github.com/crabbly). Additional content in the repository are added to understand the underlying concept of selected printing of content elements with and without [`print.js`](https://github.com/crabbly/Print.js).


Content added to this fork are added as support for the learning resource [`AppLSAC`](https://en.wikiversity.org/wiki/AppLSAC) in Wikiversity  (see [Wikiversity `AppLSAC/Print`](https://en.wikiversity.org/wiki/AppLSAC/Print).  

Javascript code can be used to creates a print job from the browser. With `print.js` specific content elements  can be submitted to printer API of the browser. Examples for content elements are:
* Form content,
* Images in a canvas,
* PDF files,
* Content of a textarea,
* ...
Javascript has as `print()` method of the `window` object of the browser, but this method allow the printing of content of the current browser window only. `print.js` allows printing of specific content elements by calling the `window.print()` function on new window, that contains the desired content only. This concept leads to the 4 main steps:
* **(Open Window)** Open a new browser window,
* **(Create Content)** write the content, that should be printed into the browser window with Javascript,
* **(Call Printer API)** call the `window.print()` function for the generated browser window,
* **(Close Window)** close the browser window

This repository was forked from [`print.js`](https://github.com/crabbly/Print.js) and inspired by developements of Rodrigo Vieira (Github User: [crabbly](https://github.com/crabbly)). The repository is used learn about printing methods within a [Javascript  WebApps](https://en.wikiversity.org/wiki/AppLSAC/Print).

<!-- BEGIN: src/readme/headerinto.md -->
The following table of contents is generated with `node doctoc README.md`.
<!-- END:   src/readme/headerinto.md -->
<hr>
<h2>Table of Contents</h2>

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Demo Files Print4JS](#demo-files-print4js)
- [Installation `Print4JS`](#installation-print4js)
  - [Installation for Browsers](#installation-for-browsers)
- [Quick Start for Library-Users](#quick-start-for-library-users)
- [Usage](#usage)
  - [Open Browser Window](#open-browser-window)
  - [Write Content to Browser Window](#write-content-to-browser-window)
  - [Call Printer Dialog](#call-printer-dialog)
  - [Close Printer Content Window](#close-printer-content-window)
  - [Dynamically Write Content without File Load](#dynamically-write-content-without-file-load)
  - [HTML Content of Printer Window](#html-content-of-printer-window)
  - [Remark](#remark)
- [Scan Files in `docs/` Folder](#scan-files-in-docs-folder)
  - [Create `docs/index.html` for Demos as HTML](#create-docsindexhtml-for-demos-as-html)
  - [Create `src/readme/demos.md` for Demos in Markdown](#create-srcreadmedemosmd-for-demos-in-markdown)
- [Wikiversity](#wikiversity)
- [Build Process of `npm run build`](#build-process-of-npm-run-build)
  - [Define Filename for build in `package.json`](#define-filename-for-build-in-packagejson)
  - [Compress after Build](#compress-after-build)
  - [Browserify and Watchify](#browserify-and-watchify)
  - [Global Installation of Browserify, Watchify, UglifyJS and DocToc](#global-installation-of-browserify-watchify-uglifyjs-and-doctoc)
  - [Package Installation of Browserify and Watchify - Alternative](#package-installation-of-browserify-and-watchify---alternative)
  - [Start Watching the Files with Watchify](#start-watching-the-files-with-watchify)
  - [Source JS file and development bundle output](#source-js-file-and-development-bundle-output)
- [Acknowledgement](#acknowledgement)
- [Libraries required for  `Print4JS`](#libraries-required-for--print4js)
- [Libraries for Building and Developement](#libraries-for-building-and-developement)
- [NPM Library Information](#npm-library-information)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
 
## Demo Files Print4JS
Demo files scanned with `scan_demos4readme.sh` - Last Update: 09.10.2019
Generated file `./src/readme/demos.md` was included into `README.md` after calling `npm run build` 
* [Demo 1: Print Content in Textarea](https://niebert.github.io/print4js/demo1_load_into_textarea.html)
* [Demo 2: Print Code](https://niebert.github.io/print4js/demo2_print_code.html)
* [Demo 3: Print Code with Print Window ](https://niebert.github.io/print4js/demo3_print_win_code.html)
* [Demo 4: Print Code with Syntax Highlighting](https://niebert.github.io/print4js/demo4_print_code_highlight.html)
* [Demo 1: Print Content in Textarea](https://niebert.github.io/print4js/demo5_print_js.html)
* [Demo 6: Print PDF with html2pdf](https://niebert.github.io/print4js/demo6_print_html2pdf.html)
* [Demo 7: Print JSON with Handlebars Template Engine](https://niebert.github.io/print4js/demo7_print_handlebars4print.html)
* [Print Window for Code with highlight.js](https://niebert.github.io/print4js/print_win_code.html)
For further information see [Wikiversity](https://en.wikiversity.org/wiki/AppLSAC)
 

## Installation `Print4JS`
The library was designed to used in a browser (WebApp). So use the installation for your browser by using a bundle `dist/print4js.js` (ee example `___PKG_DEMOLINK___`).

### Installation for Browsers
If you want to use the library `print4js.js` in a browser, please copy the file `dist/print4js.js` into your library folder of WebApp that you want to test with a browser (e.g. `js/print4js.js`). If you want expand existing examples check the basic example in `docs/index.html` first and play around with that HTML-file. If you want to import the library with `script`-tag do it in the standard way with:
```html
<script src="js/print4js.js"></script>
```
Now it is possible to use the constructor of `Print4JS`
```javascript
var  print4js = new Print4JS();
```
Now we define a hash that contains the options for the `init()`-call.
```javascript
var vOptions = {
  'debug': false
};
print4js.init(doccument, vOptions);
```
After the `init()` call the `Print4JS` instance are defined (see section about Usage). `debug=true` shows the `console.log()` in the browser for print calls in the HTML page. Default setting is false.
<!-- BEGIN: src/readme/usage.md -->

## Quick Start for Library-Users
Just copy the `docs/`-folder or rename to `myloadfile4dom` and adapt the examples to your needs.
Check out the [`Print4JS` examples](https://niebert.github.io/print4js/)

## Usage
e next steps describe the basic constituents of creating a print job within a WebApp. The following code shows the underlying software design.
```html
<html>
<head></head>
<body>
    <input type="button" value="Open Print Window" onclick="openPrintWindow()" />
</body>
<script type="text/javascript">
    function openPrintWindow(pURL) {
        var print_win = window.open(pURL);
        print_win.focus();
        return print_win
    }

    function addPrintContent(pPrintWin,pContent) {
      // pContent = '<h1>Hello, World!</h1>';
      // append to document body
      pPrintWin.document.body.innerHTML += pContent;

    }
    // var vPrintWin = openPrintWindow('about:blank');
    var vPrintWin = openPrintWindow('printwindow.html');
    addPrintContent(vPrintWin,"<h1>Hello, World!</h1>");
    vPrintWin.print();

</script>
</html>
```
For application in a WebApp (e.g. [AppLSAC](https://en.wikiversity.org/wiki/AppLSAC/Print) use the [library `print.js`](https://github.com/niebert/print4js/blob/master/dist/print.js).

### Open Browser Window
the following HTML code shows a basic concept of opening a printer window.
```javascript
// create a new printer window
var print_win = window.open('printwindow.html');
// set the focus to the browser window
print_win.focus();
```
### Write Content to Browser Window
```javascript
// create a new printer window
var print_win = window.open('about:blank');
// set the focus to the browser window
print_win.focus();
var content = '<h1>Hello, World!</h1>';
// append to document body
print_win.document.body.innerHTML += content;

```

### Call Printer Dialog
Assume the window with the generated content in `vPrintWin` then the content can be submitted to the printer with the `vPrintWin.print()` command.


### Close Printer Content Window
In general closing a window is called with `window.close()`. In this case we are closing the window with the Printer Content. The printer window can be closed with `vPrintWin.close()`, if the window was created/opened from the WebApp with Javascript (see also[AppLSAC](https://en.wikiversity.org/wiki/AppLSAC) .
```javascript
// create a new printer window
var print_win = window.open('printwindow.html');
// set the focus to the browser window
print_win.close();
```

### Dynamically Write Content without File Load
The following function loads the content of a textarea and writes the HTML content in a new browser window. The content of the browser window will be printed.
```javascript
function printTextArea() {
  console.log("Print HTML content in textarea with the ID='mytextarea'");
  var print_win = window.open("","wPrintWin","width=300,height=300,scrollbars=1,resizable=1");
  var html = document.getElementById("mytextarea").value;

  // Open a print window print_win
  print_win.document.open();
  print_win.document.write(html);
  print_win.document.close();
  print_win.focus();
  print_win.print();
  print_win.close();
}
```


### HTML Content of Printer Window
The following file shows the content of `print_win_css.html`:
```html
<html>
  <link href="css/print.css" rel="stylesheet">
  <head>
    <title>
      Printer Window CSS
    </title>
  </head>
  <body>
  </body>
</html>
```
The style sheet `css/print.css` format the output to the desired layout (e.g. font size, fonts, ...)

### Remark
The window of loaded HTML page itself cannot be closed with `window.close()`. This is not a bug. This a security feature, because web sites should not be able to close a browser window with all open tabs, because the user might loose the content of forms in that window.
## Scan Files in `docs/` Folder
The folder `docs/` contains demo HTML files, that show the application of `Print4JS` in the library `print4js.js`.

### Create `docs/index.html` for Demos as HTML
The shell script scans all demo HTML files in the folder `docs/` and creates the `index.html`. The script `

### Create `src/readme/demos.md` for Demos in Markdown
The script runs in `bash` shell for Linux and OSX. On OSX there exists a non-GNU compatible `sed` command. For compatible install `gsed` with `brew install gnu-sed` and adapt the `sed` call with the variable `sed` on GNU Linux and to `gsed` on OSX. Adapt following line according to your operating system:
```bash
### GNU Linux
SED_CMD="sed"
### OSX
SED_CMD="gsed"
```
**Remark:** Call if `gsed` on the command line in OSX. If `gsed` is not installed, use [Homebrew](https://brew.sh/) https://brew.sh/ to install the GNU compatible `gsed` with `brew install gnu-sed`.
## Wikiversity
This piece of software was created on GitLab as support material for the learning resource about privacy-friendly webbased applications `AppLSAC`](https://en.wikiversity.org/wiki/AppLSAC) on Wikiversity. An `AppLSAC` run completely in the browser without the need to submit any user generated data to a server. This package `LoadFile4DOM` is designed to learn about the first step:
* **(Load)** Load File into a browser for processing with an HTML5-WebApp (AppLSAC-1 or AppLSAC-2). The library `LoadFile4DOM` serves to cover the loading feature.
* **(Process)** Processing data can be done with any Javascript-libraries of your choice that can perform its task without submission of user generated data to a remote server. `HandleBars4Code` processes a JSON as input (UML for Javascript) to generate the JavaScript library or the `README.md` documentation for a package.
* **(Save)** If users want to save the processed results, it is recommended to look at the [FileSaver.js](https://github.com/eligrey/FileSaver.js) library provided by Eli Grey.
<!-- BEGIN: src/readme/build_process.md -->

## Build Process of `npm run build`
The build process is called by `npm run build` which in turn call `build.js`. If you want to call the build process of `build.js` separately just call `build.js` with `node build.js` from the shell/console.

The templates for building the output are stored in the folder `src/`.

After the build process the `README.md` is generated and if you want to have the table of contents in the file for the concatenation of  files in `src/readme/` listed in `files4build.js` then you must run the DocToc generator for `README.md` by `doctoc README.md` from the shell to update the table of contents in `README.md`.

### Define Filename for build in `package.json`
In `package.json` defines the filename for the automated build for
* `README.md` for readme for the repository (parts in `src/readme`),
* `index.html` for the web demo (parts in `src/html`),
* `main.css` for the style sheet (part in `src/css`) and
* `dist/print.js` is generated from the parts in `src/libs`
the sources in `src/`.
To specify these filenames add the following `build` section to the `package.json`:
```javascript
"build": {
  "readme": "README.md",
  "html": "docs/index.html",
  "css": "docs/css/main.css"
}
```
If you want to edit the generated file check the files that are selected for including into the generated files (see `files4build.js`) and set the files to a preliminary build name (e.g. like `index_build.html` instead of `index.html` to compare generated file `index_build.html` with the older version `index.html` for debugging

### Compress after Build
After building (concat the file parts) and replacement of package variables (e.g. see [`build4code`](https://www.npmjs.com/package/build4code) like  `print4js` for package name) in the generated documents the module is browserified by the command
```javascript
uglifyjs dist/print4js.js --compress -o dist/print4js.min.js
```
This command is called after `build.js` and the final step of the build process is the [`doctoc`](https://www.npmjs.com/package/doctoc) call to update the table of contents in the `README.md`. All steps of the `npm run build` command are defined in the `script` section of the `package.json` file.
<!-- END:   src/readme/build_process.md -->
## Build and Compress with Browserify, Watchify, UglifyJS
The NodeJS modules can use `require()`-command. Browsers cannot execute the `require()`-command and other node specific programming features.
* `Browserify` loads the file `dist/print.js` as input file and resolves e.g. the `require()`-command and creates an output file in `dist/print4js.js`
* `Watchify` observes any changes in the source files in `src/` and starts on the event of changes the build process of the file `dist/print.js` as input file and creates an output file in `dist/print4js.js`.
* `UglifyJS` compresses the code in `dist` and takes the file `dist/print4js.js` and generates the compressed library in `dist/print4js.min.js`. The same is applied for `docs/js/print4js.js` and the output is `docs/js/print4js.min.js`. The compression of the source code can be perform without a total build by `npm run compress`.
* The main browserify command creates a standalone library that can be used in the browser and it assign `Print4JS` to the `window` object by
```shell
  browserify src/main.js --standalone window > dist/print4js.js
```

### Browserify and Watchify
Browserify and Watchify are used in this repository to control the WebApp-javascript development with the required Javascript libraries installed with [NPM Node.js](https://docs.npmjs.com/getting-started/installing-node) and similar framework world that greatly improve your javascript workflow: Using them, you no longer need to micro-manage your script tags but instead you just declare the libraries each of your client-side modules is using - or you can even create your own reusable modules! Also, installing (or updating) javascript libraries is as easy as running a single command!
* [Additional Information about Browserify and Watchify on GitHub](https://spapas.github.io/2015/05/27/using-browserify-watchify/)
* [Youtube Video about Browserify and Watchify by Kyle Robinson Young 2015/04/16](https://www.youtube.com/watch?v=CTAa8IcQh1U)
In this repository Browserify and Watchify are used for javascript code development with [NPM Node.js](https://docs.npmjs.com/getting-started/installing-node).

### Global Installation of Browserify, Watchify, UglifyJS and DocToc
Requirement: [NPM](https://docs.npmjs.com/getting-started/installing-node) is intalled. Now call for global installation of Browserfy, Watchify, UglifyJS and DocToc by:

`npm install -g browserify watchify uglify-js doctoc`

This is recommended because your will not install Browserfy, Watchify and UglifyJS for all your repositories separately.
* ***Browserfy*** converts `node_modules` in a single library, that can be imported in WebApp. Browserify resolves dependencies and included the required libraries into the bundled javascript code.
* ***Watchify*** watches changes in the source code and runs the build process whenever it detects changes in the your source code.
* ***UglifyJS*** compresses the source code of `dist/class_editor_uml.js` into ```class_editor_uml.min.js``` to reduce download time and WebApp performance during load.
* ***DocToc*** is used to create a helpful table of contents in the README (see [DocToc-Installation]https://github.com/thlorenz/doctoc#installation) for further details on [NPM DocToc](https://www.npmjs.com/package/doctoc) ). Run `doctoc README.md` for updating the table of contents.
* ***jsLint*** is used to check the Javascript code, quality of code can be improved by application of jsLint

### Package Installation of Browserify and Watchify - Alternative
If your prefer that  browserify and watchify is installed with your `npm install` command, save these to modules to your dev-dependecies in your `package.json` by calling

* (Install Browsersify) `npm install browserify --save-dev`
* (Install Watchify) `npm install watchify --save-dev`
* (Install UglifyJS) `npm install uglify-js --save-dev`
* (Install DocToc) `npm install doctoc -g`
* (Install jshint) `npm install jslint -g`

The difference between `--save` and `--save-dev` is, that development dependencies are installed with `npm install` because they are required for the development process of the code but they are not added to the generated Javascript-bundle that are used in the WebApp ClassEditorUML. The `--save-dev` commands for `browserify` and `watchify` will install the two modules with all the the dependencies in `node_modules` and add the dev-dependencies to your `package.json`.
```json
"devDependencies": {
  "browserify": "^14.5.0",
  "watchify": "^3.9.0",
  "uglify-js": "^2.6.2",
  "doctoc":"^1.3.0",
  "lint": "^1.1.2"  
}
```
In the current repository `Browserfy` and `Watchify` are expected to be installed globally, because the `package.json` does not contain the dev-dependencies mentioned above.

### Start Watching the Files with Watchify
Watchify will trigger the `npm run build` process if files were change due to alteration of code. To start watching the files, run the npm-watch script by `npm run watch`, which is defined in `package.json`

### Source JS file and development bundle output
The main JS source file for the build process is `src/main.js`. The output library (resp. output file of build process) is stored in distrubtion library for browser based web-development in `dist/print4js.js`. Compressed code is generated with `UglifyJS`. It takes the `dist/print4js.js` as input file and creates the compressed file `dist/print4js.min.js`.
The compression of `dist/print4js.js` into `dist/print4js.min.js` uses `uglify-js` module and can be started by

  `npm run compress`

## Acknowledgement
Special thanks to the following individual developers and teams of OpenSource JavaScript projects:
* [`print.js`](https://github.com/crabbly/Print.js) by [Rodrigo Vieira](https://github.com/crabbly)
* [HandleBars](http://handlebarsjs.com/) the code generation in Javascript was developed by Yehuda Katz.
* [JSON-Editor](https://github.com/jdorn/json-editor) by Jeremy Dorn. The JSON Editor takes a JSON Schema and uses it to generate an HTML form. The JSON-Editor is partially used to edit JSON file of the [ClassEditorUML](https://niebert.github.io/ClassEditorUML) `UML` for Javascript.
* Developer [Mihai Bazon](http://lisperator.net/) create UglifyJS, a great tool to handle and parse Javascript Code and minify the Javascript code (see [Source Code of UglifyJS](https://github.com/mishoo/UglifyJS2)).
* The wrapper for UglifyJS is written [Dan Wolff](http://danwolff.se/). His UglifyJS-Online example is used to minify/compress the exported Javascript code of generated JS Classes (For Online Example of the [UglifyJS-Wrapper](https://skalman.github.io/UglifyJS-online/) see source code on https://github.com/Skalman/UglifyJS-online for the Online-Version of the Wrapper.
* Developers of ACE Code Editor https://ace.c9.io (Javascript Editing uses the Editor in iFrames)
* [FileSaver.js](https://github.com/eligrey/FileSaver.js) Developer Eli Grey provided the `FileSaver.js` that is used to store created `JSCC` files to the local filesystem. `JSCC` uses the same mechanism of browsers, that allows a `Save as...` in the context menu of a web pages or image. So not uncontrolled write access to your file system is implemented, because users have to select the locations in which the user whats to store the file (e.g. JSON, Javascript or HTML).
* [JointJS](https://github.com/clientIO/joint) JointJS is a JavaScript diagramming library. It can be used to create either static diagrams. JointJS is used in this project to create UML-diagrams, that are interactive diagramming in conjunction and application builder in Javascript.
* [Inheritage for JavaScript with protoypes](http://phrogz.net/js/classes/OOPinJS2.html) by Gavin Kistner
* [3 ways to define a JavaScript class](https://www.phpied.com/3-ways-to-define-a-javascript-class/) by Stoyan Stefanov
* [JQuery](https://jqueryui.com) is used for the theme and standard operations in the Document Object Model (DOM) of HTML-pages. The [JQuery-Themeroller](https://jqueryui.com/themeroller/) was used to create a JQuery theme for JSCC.

## Libraries required for  `Print4JS`
The following libraries are necessary for `print4js.js`:


## Libraries for Building and Developement
The following libraries are necessary for building the `print4js`. 
These libraries are not included in `print4js.js`, but e.g. are required in `build.js`.
* Lib: `@babel/core` Version: `7.4.5`
* Lib: `@babel/preset-env` Version: `7.4.5`
* Lib: `babel-loader` Version: `8.0.6`
* Lib: `build4code` Version: `^0.3.13`
* Lib: `coveralls` Version: `3.0.4`
* Lib: `css-loader` Version: `2.1.1`
* Lib: `istanbul-instrumenter-loader` Version: `3.0.1`
* Lib: `jasmine-core` Version: `3.4.0`
* Lib: `karma` Version: `4.1.0`
* Lib: `karma-chrome-launcher` Version: `2.2.0`
* Lib: `karma-coverage` Version: `1.1.2`
* Lib: `karma-jasmine` Version: `2.0.1`
* Lib: `karma-phantomjs-launcher` Version: `1.0.4`
* Lib: `karma-sourcemap-loader` Version: `0.3.7`
* Lib: `karma-webpack` Version: `3.0.5`
* Lib: `mini-css-extract-plugin` Version: `0.7.0`
* Lib: `node-sass` Version: `4.12.0`
* Lib: `optimize-css-assets-webpack-plugin` Version: `5.0.1`
* Lib: `sass-loader` Version: `7.1.0`
* Lib: `shelljs` Version: `^0.8.3`
* Lib: `standard` Version: `12.0.1`
* Lib: `uglifyjs-webpack-plugin` Version: `2.1.3`
* Lib: `webpack` Version: `4.33.0`
* Lib: `webpack-cli` Version: `3.3.3`
* Lib: `webpack-dev-server` Version: `3.7.1`

## NPM Library Information
* Exported Module Variable: `Print4JS`
* Package:  `print4js`
* Version:  `1.0.61`   (last build 2019/10/09 0:02:16)
* Homepage: `http://printjs.crabbly.com`
* License:  MIT
* Date:     2019/10/09 0:02:16
* Require Module with:
```javascript
    const vPrint4JS = require('print4js');
```
* JSHint: installation can be performed with `npm install jshint -g`
<!-- BEGIN: src/readme/tail.md -->
<!-- END:   src/readme/tail.md -->
