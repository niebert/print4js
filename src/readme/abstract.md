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
