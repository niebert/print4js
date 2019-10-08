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

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
 
## Demo Files Print4JS
Demo files scanned with `scan_demos4readme.sh` - Last Update: 08.10.2019
Generated file `./src/readme/demos.md` was included into `README.md` after calling `npm run build` 
* [Demo 1: Print Content in Textarea
Print4JS Demo](https://niebert.gitlab.io/print4js/demo1_load_into_textarea.html)
* [Demo 2: Print Code](https://niebert.gitlab.io/print4js/demo2_print_code.html)
* [Demo 2: Print Code Highlight](https://niebert.gitlab.io/print4js/demo3_print_code_highlight.html)
* [Demo 4: Print PDF with html2pdf](https://niebert.gitlab.io/print4js/demo4_print_html2pdf.html)
* [Demo 8: Print JSON with Handlebars Template Engine](https://niebert.gitlab.io/print4js/demo8_print_json4handlebars.html)
For further information see [Wikiversity](https://en.wikiversity.org/wiki/AppLSAC)
 

## Installation `Print4JS`
The library was designed to used in a browser (WebApp). So use the installation for your browser by using a bundle `dist/print4js.js` (ee example `___PKG_DEMOLINK___`).

### Installation for Browsers
If you want to use the library `print4js.js` in a browser, please copy the file `dist/print4js.js` into your library folder of WebApp that you want to test with a browser (e.g. `js/print4js.js`). If you want expand existing examples check the basic example in `docs/index.html` first and play around with that HTML-file. If you want to import the library with `script`-tag do it in the standard way with:
```html
<script src="js/loadfile4dom.js"></script>
```
Now it is possible to use the constructor of `Print4JS`
```javascript
var  lf4d = new Print4JS();
```
Now we define a hash that contains the options for the `init()`-call.
```javascript
var vOptions = {
  'debug': false
};
lf4d.init(doccument, vOptions);
```
After the `init()` call the loaders are defined (see section about Usage). `debug=true` shows the holder and the `<input type="file" ...>` elements in the browser view of the HTML page. Default settings is false.

Keep in mind that injection of the Load Dialogs must be performed when the document was loaded, so we need to call the `create()` method when the `onload` event was triggered by the browser. This is done by:
```html
<body onload="lf4d.create()">
```

### NodeJS - Update `Print4JS` with new Features
This sections is for developers that want to extend or modify the features of `Print4JS`.

Assume you want to expand the file handler for `zip`-files in a way, that it will return an instance of `JSZip` directly. Currently `Print4JS` with the loadtype `zip` will just take care, that only `zip` files with correct MIME type `application/zip` can be selected with `zip`-Loader. To extend the `Print4JS` module we require multiple file instead of the raw binary of the zip-file. So we update the method `handle_zip()`.

Lets call your new NPM module `loadzip4dom` and we create an empty directory with that name and call as usual a `package.json` with:
```JavaScript
npm init
```
use as entry point `src/main.js`
and add the module `Print4JS` to dependencies of your new package by:
```javascript
npm install --save print4js
```
Now we create a directory `src` and a file `src/main.js` can `require` the added module to the

Now the module is installed and you can to use the constructor `Print4JS` in your new Node NPM module with the following require-call:
```javascript
// require all the modules you need for the new browserified library ...

const  Print4JS = require('print4js');
Print4JS.prototype.handle_zip = function (...) {
  // write a new ZIP file handler e.g. using JSZip
  //
}
//... export the instance with new feature
module.exports = Print4JS;
```
You find a UML file of 
Due to the fact that the library was designed for WebApps that run in a regular browser, the library requires `Document Object Model (DOM)` to create a load dialog for loading files in a browser also your new module must be [browserified](http://browserify.org/) e.g. into the module `LoadZip4DOM` - see [AppLSAC](https://en.wikiversity.org/wiki/AppLSAC) in Wikiversity for further details.


### NodeJS Testing Library `Print4JS` with JSDom
In order to test new feature we require in `test`-script the library [`jsdom`](https://www.npmjs.com/package/jsdom).

To test and expand the Library with additional feature we create in test-scripts like `tests/test.js` as a DOM content. Wit `jsdom` module we can analyse if the library properly  inject the required HTML elements into the DOM of browser without for testing the modification of the code with the HTML file `docs/index.html` and an appropriate `script`-tag `<script src="js/print4js.js"></script>` in the browser.

The following code shows the test script `tests/test.js` that can be executed with `node tests/test.js` of with `npm run buildtest`.

```javascript
// emulate the DOM with 'jsdom'
const jsdom = require('jsdom');
const { JSDOM } = jsdom;

const  Print4JS = require('.dist/print.js');
let  lf4d = new Print4JS();
// define options for LoadFile4DOM holder in the DOM

```
We need to feed a DOM content, that `Print4JS` works with. The sample DOM tree in the test script `tests/test.js` was defined as. Modify the content according to your test settings.
```javascript
const vDOM = new JSDOM(`<!DOCTYPE html>
<html>
  <body>
    <textarea id="mytxtfile" row="5" cols="80"></textarea>
    <div id="myloaderid" style="display:none">
    </div>
  <body>
</html>`);
// create a reference for the window.document
let doc = vDOM.window.document;
```
Now we have an emulated DOM with the reference to the `document` object, that allows the test the DOM element injection.
```javascript
let vOptions = {
  'id4loadfile': 'myloaderid',
  'debug': true
};
lf4d.init(doc, vOptions)
```
* (optional) `'debug':true` shows the injected `<input type='file' ...>` that are injected into the DOM tree by `Print4JS`.
* (optional) `'id4loadfile': 'myloaderid'` the ID of the `div` element to which the all loaders (e.g. for `text`, `images`, `json`, `zip` are injected.
* All loaders are created by one instance of `Print4JS` to assure a conflict free ID management of generated `<input type='file' ...>` elements in the DOM.
* if you have an `iframe` in your DOM it has an own `document` object. You might want to create another instance for injecting loaders in the iFrame document as well.

**Remark:** Keep in mind that you should create an instance of `Print4JS` every different `document` object you are injecting Load Dialog to. In general one instance should be sufficient in most use-cases for  `Print4JS`.
<!-- BEGIN: src/readme/usage.md -->

## Quick Start for Library-Users
Just copy the `docs/`-folder or rename to `myloadfile4dom` and adapt the examples to your needs.
Check out the examples:
* [Load file into textarea](https://niehausbert.gitlab.io/loadfile4dom/loadtextarea.html)
* [Load files into ZIP](https://niehausbert.gitlab.io/loadfile4dom/upload2zip.html)
* [Load Images into DOM and into ZIP](https://niehausbert.gitlab.io/loadfile4dom/loadimages.html)
* [Load JSON into Template Engine Handlebars4Code](https://niehausbert.gitlab.io/loadfile4dom/handlebars4code.html)
Check the javascript source in HTML file. [Download ZIP file of LoadFile4DOM](https://gitlab.com/niehausbert/loadfile4dom/-/archive/master/loadfile4dom-master.zip)

## Usage
You can have one or more `LoadFile4DOM` nodes in your webbased application. The following code shows how to create `LoadFile4DOM` node (see [Demos Examples](https://niehausbert.gitlab.io/loadfile4dom))
```javascript
var lf4d = new LoadFile4DOM();
var options = {
  "id4loadfile": "allmyloaddialogs"
};
lf4d.init(document,options);
var txtfile = lf4dom.get_options("mytxtfile","all");
// set the onload handler for the loaded files
//txtfile.returntype = "file" and not "filehash" so data contains the textstring
txtfile.onload = function (data,err) {
  if (err) {
    console.error(err);
  } else {
    // do something with the file content in data e.g. store  in a HTML textarea (e.g. <textarea id="mytextarea" ...>
    document.getElementById("mytextarea").value = data.file;
  }
}
lf4d.create_load_dialog(txtfile);
```
The Load Dialogs are created with the `onload` event handler in the body tag of your HTML file.

```html
   <body onload="lf4d.create()">
```

Now you can define an `onclick` event in a button to open the load menu similar to the upload feature of web sites.
```html
<input type="button" onclick="lf4d.open_dialog('mytxtfile')" value="Load TXT File">
```
or with a `button`-tag with
```html
<button onclick="lf4d.open_dialog('myhtmlfile')"> Load HTML File</button>
```
Furthermore you can open the menu with an `onclick` event on a link by
```html
This is a <a href="#" onclick="lf4d.open_dialog('myhtmlfile')">link to open the menu</a> in a HTML file.
```

### File Extensions
It is possible to set a mandatory file extension for the loaded files. This mandatory file extension will be checked for all loaded files. The following code creates a `DIV` tag in the DOM with the ID `allmyloaddialogs`. This ID can be used for debugging and learning about `LoadFile4DOM`, because by `document.getElementById('allmyloaddialogs')`  programmers can analyse what is injected in the DOM tree for the generated loaders (see [Demos Examples](https://niehausbert.gitlab.io/loadfile4dom)).

In this example the file extensions can be set with `txtfile.file_extension = ".txt"` after generating the default options for a new text file loader with the ID `mytextfile`.

```javascript
//--- Create a LoadFile4DOM instance ---
// you need one instance for all loaders
var lf4d = new LoadFile4DOM();
var options = {
  "id4loadfile": "allmyloaddialogs"
};
lf4d.init(document,options);

//-----------------------------------------------
//----- Create a new Loader "mytxtfile" ---------
//-----------------------------------------------
var txtfile = lf4d.get_loader_options("mytxtfile","text");
// set mandatory file extensions
txtfile.file_extension = ".txt";
// set the onload handler for the loaded files
txtfile.onload = function (data,err) {
  // define file handler

}
lf4d.create_load_dialog(txtfile);
```
Mandatory file extensions are helpful especially for `zip`-files:
* [Geogebra files](https://www.geogebra.org) are `zip`-files and they have the file extension `.ggb`. The corresponding [MIME](https://en.wikipedia.org/wiki/Media_type) type for `ggb`-files is `application/vnd.geogebra.file`
* [LibreOffice Writer files](https://www.libreoffice.org/discover/writer/) are `zip`-files and they have the file extension `.odt`. The corresponding [MIME](https://en.wikipedia.org/wiki/Media_type) type for `ODT` is
`application/vnd.oasis.opendocument.text`

The file extension check is implemented in the method `LoadFile4DOM.error_file_type()`.

### Return Types
The onload handler could get different processed JSON objects as return types.
* `file` is
  * just the text for file type `text`
  * the parsed JSON for file type `json`
  * binary version (blob) of loaded file
* `filehash` contains also the filename if browser return the name of the file. This is not standard and might result in an unexpected behavior if not used in Firefox or Chrome. `filehash` return a hash with
```javascript
   data = {
     "name": "myloadedfile.txt",
     "file": "the content of the loaded text file",
     "mime_type":"text/plain"
   }
```
  * here the attribute `data.file` contains the text of file, or
  * **Loader Type: `json`** `data.file` contains the parsed JSON for the loader file type `json`
  * `data.file` contains the base64 content of loaded file
  * `mime_type` contain the [MIME type of the file](https://en.wikipedia.org/wiki/Media_type)
* `tag` as return type creates an image tag as string for the DOM that contain the image. This is applicable for filetype `image_thumb`.

### Image Thumb
The loader type `image_thumb` is appropriate for loading thumbnail images and return an image tag with the thumbnail size that can be appended to the DOM. Append the image tag to DOM uses the returned a string for the tag to append to the `innerHTML` of a DIV element (see [Demos Examples](https://niehausbert.gitlab.io/loadfile4dom)).

For the following example we assume that the following `div` element with the id `outlist` is located somewhere in the document body of the DOM (Document Object Model) of the browser document (i.e. loaded HTML page).
```html
<div id="outlist"></div>
```
The following Loader of the type `image_thumb`. The default image size of the thumbnail is defined by `file2image.width = 200` to a width of 200 pixel.
```javascript
//--- Create a LoadFile4DOM instance ---
// you need one instance for all loaders
var lf4d = new LoadFile4DOM();
var options = {
  "debug": false // if true, it will show the hidden <input type="file" ...> loaders in DOM
};
lf4d.init(document,options);
//-----------------------------------------------
//----- Create a new Loader "file2image" --------
//-----------------------------------------------
var file2image = lf4d.get_loader_options("addfile2image","imagethumb");
file2image.returntype = "tag";
file2image.width = 200;
// Define what to do with the loaded data
file2image.onload = function (data,err) {
  if (err) {
    // do something on error, err contains error message
    console.error(err);
  } else {
    // do something with the file content in data e.g. store  in a HTML textarea (e.g. <textarea id="mytextarea" ...>
    console.log("CALL: file2image.onload()");
    var vNode = document.getElementById("outlist");
    if (vNode) {
      vNode.innerHTML = vNode.innerHTML + "<br>" + data.tag + " ";
    } else {
      console.error("ERROR: DOM Element 'outlist' does not exist!");
    }

  }
};
// create the load dialog 'file2image'
lf4d.create_load_dialog(file2image);
```

### Format of the Returned Filehash
The `data` hash contains the following properties:
```javascript
data = {
  "name": "myimage.png",
  "file": "uASo3hSODBFl9fsdf...",
  "mime_type": "image/png",
  "tag": "<img src='....' width='200'>"
};
```
The `data.file` attribute can be used to store the images into ZIP. The main property to display the image is the `data.tag` attribute.   
* The property `data.name` contains the filename of the loaded file if the browser provides the filename (without path) of the loaded file.
* The property `data.file` contains the base64 encoded content of the image
* The property `data.mime_type` contains the [MIME](https://en.wikipedia.org/wiki/Media_type) type of the image.
* The property `data.tag` contains the HTML tag of the thumbnail image.

### Load Images
The loader of type `image` create an `new Image()` object and populates the attributes `width`, `height` (see [Demos Examples](https://niehausbert.gitlab.io/loadfile4dom)).

```javascript
img = new Image();
// populate i...

data = {
  "name": "myimage1.png",
  "file": "base64,uASo3hSODBFl9fsdf...",,
  "mime_type": "image/png",
  "img": "<img src='....' width='640'>"
};
```

### Load Files into JSON/Javascript
If you want to create digital product that is dependent on binary data, you can check the example [Load Files into JSON](https://niehausbert.gitlab.io/loadfile4dom/files2jslib.html). The [Demo](https://niehausbert.gitlab.io/loadfile4dom/files2jslib.html) creates a JSON file or Javascript file with all the loaded files the filenames and the MIME types.

E.g. if you want to create a LibreOffice document and populate the content of the generated content of the WebApp then you need a ZIP file of the Office document in which the file `content.xml` is replaced. Due to security limitations the browser cannot access binary content from the filesystem without permission (standard application on your operating system have permissions to write to the filesystem). By storing only required files in a JSON file or Javascript files an arbitrary access to the filesystem is still not available (good for privacy) and only the binary files need for the WebApp are stored in a JSON or a Javascript library.

The following JSON can be created with the [Load to JSON Demo](https://niehausbert.gitlab.io/loadfile4dom/files2jslib.html).  To create a [JSON with an array of files](https://niehausbert.gitlab.io/loadfile4dom/files2json.html) the resulting JSON could look like this.
All file have a MIME-type and a file name for the file. This is helpful for saving file from the WebApp by application of the library `filesaver.js`. Even binary files can be stored in this JSON file by base64 encoding. This assures that no binary data gets lost, because every byte of the binary data is encode in two characters. Finally the binary data is represented by `base64` encoded string, which consumes more memory but can be summitted and stored in data structures that are designed for strings (see [Demos Examples](https://niehausbert.gitlab.io/loadfile4dom)).

The results of the demo is e.g. the following JSON for 2 added files:
* the first file is a LibreOffice-ODT document `my_office_doc.odt`, which is in fact a ZIP-file with a special file and folder structure, that can be handled and modified with `JSZip`. The binary data was `base64` encoded.
* the second file is a standard text file with a new line `\n` and tab character `\t`. The text file is not encoded in `base64`, so that the file content can be used directly in the WebApp resp. DOM tree, e.g. by storing the content in a HTML textarea for further editing by the user of the WebApp.

```json
[
    {
        "name": "my_office_doc.odt",
        "file": "bW96THo0MAAGDwAA8....",
        "mime_type": "application/vnd.oasis.opendocument.text"
    },
    {
        "name": "my_comments.txt",
        "file": "this are \t my comment\nloaded from a file",
        "mime_type": "text/plain"
    }
]
```
If you want to store the JSON listed above as a Javascript library and load the data in the main HTML document e.g. `index.html`, you can add the following lines in `index.html`.
```html
<script>
   var vDataJSON = {
     "files" : null
   };
</script>
<script src="myfiles.js"></script>
```
In the library `myfiles.js` is just a slightly modified JSON file, that looks like this.
```javascript
// this is a content of 'myfiles.js'
var  vDataJSON.files = [
    {
        "name": "my_office_doc.odt",
        "file": "bW96THo0MAAGDwAA8....",
        "mime_type": "application/vnd.oasis.opendocument.text"
    },
    {
        "name": "my_comments.txt",
        "file": "this are \t my comment\nloaded from a file",
        "mime_type": "text/plain"
    }
]
```
**Remark:** Please keep in mind, that the content of file attribute `file` for the LibreOffice document is actually a very long string. The displayed content `bW96THo0MAAGDwAA8....` in this tutorial is not a real ODT-file. To create usable Javascript libraries with stored binary and text files use the demo WebApp (see [AppLSAC](https://en.wikiversity.org/wiki/WebApps_with_LocalStorage_and_AppCache)).

### Load LibreOffice Files in WebApp
Assume we store LibreOffice file `libreoffice_template.odt` in a JSON and load the JSON data as library in WebApp. The stored ODT `libreoffice_template.odt` has the MIME type `application/vnd.oasis.opendocument.text` but it is in fact a ZIP file. So creating a LibreOffice file with a WebApp can use a stored ZIP file as template and add user defined content from an editor to the LibreOffice file `my_office_doc.odt`, add images to the document by using the stored  just needs `my_office_doc.odt` as template for the layout of generated LibreOffice document in the WebApp. `JSZip` can be used to process `libreoffice_template.odt` and replace the file `content.xml` in the ZIP.

```javascript
zip.file("content.xml", my_new_content);
```

When you upload files to a JSON the

### ZIP-Files
Saving binary data into a zip-file with `JSZip` the first conclusion is to use
```javascript
zip.file("myimage.png", imgData); // NOT WORKING
```
where `imgData` is a `base64` encoded string. `JSZip` reads `imgData` as string and this implies that the file get corrupted. It is necessary to provide an option to `JSZip` that you want to save an (unicode) string. The example above will not work, because `imgData` is a binary and not a textual content. To avoid that the `zip`-file receives a corrupted content, it is necessary to pass the binary option to the zip handler (see [Demos Examples](https://niehausbert.gitlab.io/loadfile4dom)).

```javascript
zip.file("myimage.png", imgData, {base64: true})
```
See [ZIP-Example](https://niehausbert.gitlab.io/loadfile4dom/upload2zip.html)



<!-- JSON-schema `docs/schema` and the JSON data in the folder `docs/db/` to the schema for your requirements. If you want to create your own JSON schema use the [JSON2Schema tool](https://niebert.github.io/JSON2Schema).

-->

<!-- END:   src/readme/usage.md -->
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
* Lib: `build4code` Version: `^0.3.7`
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
* Version:  `1.0.61`   (last build 2019/10/08 10:47:26)
* Homepage: `http://printjs.crabbly.com`
* License:  MIT
* Date:     2019/10/08 10:47:26
* Require Module with:
```javascript
    const vPrint4JS = require('print4js');
```
* JSHint: installation can be performed with `npm install jshint -g`
<!-- BEGIN: src/readme/tail.md -->
<!-- END:   src/readme/tail.md -->
