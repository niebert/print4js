var shell = require('shelljs');

shell.ls('./dist/*').forEach(function (file) {
  shell.echo('File: '+file);
});
shell.cp('', './dist/print.js', './docs/js/print4js.js');
shell.cp('', './dist/print.map', './docs/js/print4js.map');
shell.cp('', './dist/print.css', './docs/css/print4js.css');
shell.echo('BUILD LIBS to Demo - Source: "dist/" > Destination: "docs/js"');
