//---------------------------------------------------
// --- Build JS/HTML/CSS Version: 1.0.0 -------------
//---------------------------------------------------
const pkg = require('./package');
const b4c = require('build4code');
const codegen = b4c.codegen;
const f4b = require('./files4build');

pkg.name = "print4js";


// ------ Build Settings -----------------
pkg.githubuser = pkg.githubuser || "gituser";
pkg.build = pkg.build || {};
pkg.build.readme = pkg.build.readme || "README_build.md";
pkg.build.html = pkg.build.html || "docs/index_build.html";
pkg.build.css = pkg.build.css || "docs/css/main_build.css";
pkg.build.htmlsrc = pkg.build.htmlsrc || "docs/index_src_libs_build.html";
pkg.exportvar = pkg.exportvar || codegen.capitalizeFirstLetter(pkg.name);
var vExportVar = pkg.exportvar; // defined in src/libs/exportmod.js
var vSrcPath = "src/"; // Path to Source Libraries
var vDistPath = "dist/"; // Path to distribution
var vLibPath = vSrcPath + 'libs/';
var vHtmlPath = vSrcPath + 'html/';
var vCssPath = vSrcPath + 'css/';
var vReadmePath = vSrcPath + 'readme/';
var vLibDist = 'dist/'+pkg.name+'.js';
var vLibOut = 'docs/js/'+pkg.name+'.js';

// the following get-function return arrays of filenames
var vLibs4Build = f4b.getLibs4Build(vLibPath);
var vHtml4Build = f4b.getHtml4Build(vHtmlPath);
var vReadme4Build = f4b.getReadme4Build(vReadmePath);
var vCss4Build = f4b.getCss4Build(vCssPath);
/* vLibs4Build will look like this
var vLibs4Build = [
  './src/npm_header.js',
  //vLibPath+'require_mods.js',
  //vLibPath+'arrayhash.js',
  vLibPath+'handlebars.js',
  vLibPath+'handlebars_helpers.js',
  //'./src/npm_inherit.js',
  vLibPath+'exportmod.js'
];
*/
// ----------------------------------------
// Process Chaining
// (1) create "npm_header.js" and "npm_tail.js" in src/libs
// (2) concat files export library to docs/js with prepend npm_header.js
// (3) create src/main.js for browserify and append "npm_tail.js"
// (4) create docs/index.html for browser test of WebApp
// (5) create README.md for documentation of WebApp


pkg.exportvar = vExportVar;

//-----------------------------------------
//----CREATE main,libs,css,html,readem-----
codegen.create_header(pkg);
//-----------------------------------------
//--- for super class inheritance ---------
//codegen.create_inherit(pkg);
//codegen.create_readme_inherit(pkg);
//--- for extension of libraries ----------
codegen.create_inherit_static(pkg);
codegen.create_readme_inherit_static(pkg);
//-----------------------------------------
codegen.create_tail(pkg);
codegen.create_html_title(pkg);
codegen.create_html_description(pkg);
codegen.create_html_tail(pkg);
codegen.create_readme_header(pkg);
codegen.create_readme_install(pkg);
codegen.create_readme_devlibs(pkg);
codegen.create_readme_tail(pkg);
codegen.create_header(pkg);

//-----------------------------------------
//----CONCAT main,libs,css,html,readem-----
// MAIN.js create library and append "modules.export"
codegen.concat_main(pkg.main,vLibs4Build,pkg);
console.log("NPM Build DONE: ",pkg.main);
// LIB:  create the library in /dist folder
codegen.concat_libs(vLibDist,vLibs4Build,pkg);
console.log("Build DONE: ",vLibDist);
// DOCS: create the library in /docs folder
codegen.concat_libs(vLibOut,vLibs4Build,pkg);
console.log("Build DONE: ",vLibOut);
/*
*/

codegen.create_script_tags4libs("./src/html_src_libs_embed.html",vLibs4Build,pkg);


codegen.concat_html(pkg.build.html,vHtml4Build,pkg);
codegen.concat_css(pkg.build.css,vCss4Build,pkg);
codegen.concat_readme(pkg.build.readme,vReadme4Build,pkg);
//-----------------------------------------
// CALL: write_convert_json() applied on README.md
// replaces ___PKG_NAME___ by pkg.name
// replaces ___PKG_EXPORTVAR___ by pkg.exportvar
// replaces ___PKG_GITHUBUSER___ by pkg.githubuser
function writeConvertCall() {
  console.log("HTML: Replace ___PKG___ variables in generated file: "+pkg.build.html);
  codegen.write_convert_json(pkg.build.html, pkg.build.html, pkg);
  console.log("CSS: Replace ___PKG___ variables in generated file: "+pkg.build.css);
  codegen.write_convert_json(pkg.build.css, pkg.build.css, pkg);
  console.log("README: Replace ___PKG___ variables in generated file: "+pkg.build.readme);
  codegen.write_convert_json(pkg.build.readme, pkg.build.readme, pkg);
  console.log("LIB: Replace ___PKG___ variables in generated file: "+pkg.main);
  codegen.write_convert_json(pkg.main, pkg.main, pkg);
  console.log("Replacing ___PKG___ variables in generated files DONE: "+vLibOut);

  /*
  console.log("Require Constructor jscc/constructor.js");
  var vConstructor = require("./jscc/constructor.js");
  console.log("Constructor: " + vConstructor);
  b4c.js2uml(pkg.exportvar,vConstructor,pkg);
  */

  codegen.log_done(pkg);
}

/* Javascript UML */
// populate package.json for JS2UML
pkg.js2uml = pkg.js2uml || {};
pkg.js2uml.filename = 'jscc/' + pkg.name + '_uml.json';
pkg.js2uml.default = 'jscc/' + pkg.name + '.json';
pkg.js2uml.is_constructor = true;

/*
var vCode = codegen.load_file('./src/'+pkg.name+'.js');
// add objects for imported libraries in index.html for ["JQuery","LinkParam","JSZip"]
vCode  = codegen.create_constructor("./jscc/constructor.js",vCode,["LinkParam","JSZip"], pkg);
*/

//------ Create UML ----
//const pkg = require('./package.json')
// const b4c = require('build4code');
//

setTimeout(writeConvertCall,1000);

/*
*/
