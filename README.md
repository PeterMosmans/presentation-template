presentation-template
=====================
A presentation framework to facilitate generating HTML presentations and static PDF files from markdown syntax.


Usage
=====
Clone this repository, and create a markdown presentation called ```talk.md```.
Make sure that ```Makefile``` contains the correct path to your favourite Internet browser.

* ```make example```: Generate and view an example in your browser
* ```make all```: Generate a DZslides HTML presentation from the file ```talk.md```
* ```make pdf```:  Generate a PDF file from the file ```talk.md```
* ```make view```: Generate a DZslides HTML presentation and open the presenter view in your browser



The CSS file ```css/include.css``` contains a modified version of the DZslides stylesheet. Modify it even further to your liking. Be creative.

The ```header.txt``` file contains a license to be included in the DZslides HTML code for your presentation content. Personally I use the [Creative Commons license](http://creativecommons.org/licenses/by-sa/4.0/), but feel free to modify this for your own content.


It exists of
* ```Makefile```: To generate PDF and HTML files using GNU make
* ```header.txt```: A text file (license) which will be included in the HTML presentation
* ```my.dzslides```: A pandoc template for creating DZslides presentations
* ```css/include.css```: A CSS file which will be included in the HTML presentation
* ```shells/embedder.html```: To embed a presentation in a webpage
* ```shells/onstage.html```: To show your slides with a control panel.

The ```my.dzslides``` template is a slightly modified version from the original pandoc package.


Dependencies
============
* [Pandoc](http://pandoc.org): To convert markdown files to HTML and PDF files
* [GNU Make](https://www.gnu.org/software/make/): For automating all steps


Licenses
========

This makefile and framework is licensed under the [GNU General Public License version 3](http://www.gnu.org/licenses/gpl.html).
DZslides is licensed under the [do what the fuck you want to public license](http://www.wtfpl.net/txt/copying/).


Thanks to
=========
The creator(s) and maintainers of DZslides. See https://github.com/paulrouget/dzslides for more information.

The creator(s) and maintainers of Pandoc. See http://pandoc.org for more information.


## How to push changes upstream ##
```
git remote add upstream https://github.com/PeterMosmans/presentation-template
git fetch upstream
git diff upstream/master -- .gitignore Makefile css/include.css my.dzslides
```
