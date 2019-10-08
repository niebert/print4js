

### NodeJS - Update `___PKG_EXPORTVAR___` with new Features
This sections is for developers that want to extend or modify the features of `___PKG_EXPORTVAR___`.

Assume you want to expand the file handler for `zip`-files in a way, that it will return an instance of `JSZip` directly. Currently `___PKG_EXPORTVAR___` with the loadtype `zip` will just take care, that only `zip` files with correct MIME type `application/zip` can be selected with `zip`-Loader. To extend the `___PKG_EXPORTVAR___` module we require multiple file instead of the raw binary of the zip-file. So we update the method `handle_zip()`.

Lets call your new NPM module `loadzip4dom` and we create an empty directory with that name and call as usual a `package.json` with:
```JavaScript
npm init
```
use as entry point `src/main.js`
and add the module `___PKG_EXPORTVAR___` to dependencies of your new package by:
```javascript
npm install --save ___PKG_NAME___
```
Now we create a directory `src` and a file `src/main.js` can `require` the added module to the

Now the module is installed and you can to use the constructor `___PKG_EXPORTVAR___` in your new Node NPM module with the following require-call:
```javascript
// require all the modules you need for the new browserified library ...

const  ___PKG_EXPORTVAR___ = require('___PKG_NAME___');
___PKG_EXPORTVAR___.prototype.handle_zip = function (...) {
  // write a new ZIP file handler e.g. using JSZip
  //
}
//... export the instance with new feature
module.exports = ___PKG_EXPORTVAR___;
```
You find a UML file of
Due to the fact that the library was designed for WebApps that run in a regular browser, the library requires `Document Object Model (DOM)` to create a load dialog for loading files in a browser also your new module must be [browserified](http://browserify.org/) e.g. into the module `LoadZip4DOM` - see [AppLSAC](https://en.wikiversity.org/wiki/AppLSAC) in Wikiversity for further details.


### NodeJS Testing Library `___PKG_EXPORTVAR___` with JSDom
In order to test new feature we require in `test`-script the library [`jsdom`](https://www.npmjs.com/package/jsdom).

To test and expand the Library with additional feature we create in test-scripts like `tests/test.js` as a DOM content. Wit `jsdom` module we can analyse if the library properly  inject the required HTML elements into the DOM of browser without for testing the modification of the code with the HTML file `docs/index.html` and an appropriate `script`-tag `<script src="js/___PKG_NAME___.js"></script>` in the browser.

The following code shows the test script `tests/test.js` that can be executed with `node tests/test.js` of with `npm run buildtest`.

```javascript
// emulate the DOM with 'jsdom'
const jsdom = require('jsdom');
const { JSDOM } = jsdom;

const  ___PKG_EXPORTVAR___ = require('.___PKG_MAIN___');
let  lf4d = new ___PKG_EXPORTVAR___();
// define options for LoadFile4DOM holder in the DOM

```
We need to feed a DOM content, that `___PKG_EXPORTVAR___` works with. The sample DOM tree in the test script `tests/test.js` was defined as. Modify the content according to your test settings.
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
* (optional) `'debug':true` shows the injected `<input type='file' ...>` that are injected into the DOM tree by `___PKG_EXPORTVAR___`.
* (optional) `'id4loadfile': 'myloaderid'` the ID of the `div` element to which the all loaders (e.g. for `text`, `images`, `json`, `zip` are injected.
* All loaders are created by one instance of `___PKG_EXPORTVAR___` to assure a conflict free ID management of generated `<input type='file' ...>` elements in the DOM.
* if you have an `iframe` in your DOM it has an own `document` object. You might want to create another instance for injecting loaders in the iFrame document as well.

**Remark:** Keep in mind that you should create an instance of `___PKG_EXPORTVAR___` every different `document` object you are injecting Load Dialog to. In general one instance should be sufficient in most use-cases for  `___PKG_EXPORTVAR___`.
