var shell = require('shelljs');

shell.ls('./dist/*').forEach(function (file) {
  shell.echo('File: '+file);
});
shell.cp('-R', './dist/*', './docs/js/');
shell.echo('BUILD LIBS to Demo - Source: "dist/" > Destination: "docs/js"');
