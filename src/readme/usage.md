<!-- BEGIN: src/readme/usage.md -->

## Quick Start for Library-Users
Just copy the `docs/`-folder or rename to `myloadfile4dom` and adapt the examples to your needs.
Check out the [`___PKG_EXPORTVAR___` examples](https://niebert.github.io/print4js/)

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
