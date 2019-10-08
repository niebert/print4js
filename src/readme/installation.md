
## Installation `___PKG_EXPORTVAR___`
The library was designed to used in a browser (WebApp). So use the installation for your browser by using a bundle `dist/___PKG_NAME___.js` (ee example `___PKG_DEMOLINK___`).

### Installation for Browsers
If you want to use the library `___PKG_NAME___.js` in a browser, please copy the file `dist/___PKG_NAME___.js` into your library folder of WebApp that you want to test with a browser (e.g. `js/___PKG_NAME___.js`). If you want expand existing examples check the basic example in `docs/index.html` first and play around with that HTML-file. If you want to import the library with `script`-tag do it in the standard way with:
```html
<script src="js/___PKG_NAME___.js"></script>
```
Now it is possible to use the constructor of `___PKG_EXPORTVAR___`
```javascript
var  ___PKG_NAME___ = new ___PKG_EXPORTVAR___();
```
Now we define a hash that contains the options for the `init()`-call.
```javascript
var vOptions = {
  'debug': false
};
___PKG_NAME___.init(doccument, vOptions);
```
After the `init()` call the `___PKG_EXPORTVAR___` instance are defined (see section about Usage). `debug=true` shows the `console.log()` in the browser for print calls in the HTML page. Default setting is false.
