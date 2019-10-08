
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

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Print4JS Steps](#print4js-steps)
  - [Open Browser Window](#open-browser-window)
  - [Write Content to Browser Window](#write-content-to-browser-window)
  - [Call Printer Dialog](#call-printer-dialog)
  - [Close Printer Content Window](#close-printer-content-window)
  - [Dynamically Write Content without File Load](#dynamically-write-content-without-file-load)
  - [HTML Content of Printer Window](#html-content-of-printer-window)
  - [Remark](#remark)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Print4JS Steps
The next steps describe the basic constituents of creating a print job within a WebApp. The following code shows the underlying software design.
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
