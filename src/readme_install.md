

## Installation `Print4JS`
There are two main types to use `Print4JS` for you projects. With a `script`-tag in your HTML file or with a package manager like [NPM](https://www.npmjs.com/) with [NodeJS]()
### Installation `Print4JS` with NPM for Scripts
Assume you have NPM installed and your have created e.g. a folder `mypackage/` for your package with `package.json` in the folder `. Go to the folder `mypackage/` and call
```javascript
npm install print4js --save
```
Then you will find `print4js` in the folder `mypackage/node_modules/print4js`.
If you want to use `Print4JS` in your scripts use the following require-call:
```javascript
const  Print4JS = require('print4js');
```
Now it is possible to use `Print4JS` in your scripts.
### Installation `Print4JS` for Browser for Scripts-Tags
If you want to use the library `print4js.js` in a browser, please copy the file `dist/print4js.js` into your library folder (e.g. `/js`) and
import the library with `script`-tag with:
```html
<script src="js/print4js.js"></script>
```
Now it is possible to use `Print4JS` in your other imported scripts.
