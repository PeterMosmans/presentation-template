# standard input file and extension
INPUT=talk
INPUT_TYPE=md

# Location of binaries used for viewing
ifeq (,$(findstring windows,$(shell uname -s)))
	FIREFOX=c:/Program\ Files\ \(x86\)/Mozilla\ Firefox/firefox.exe
else
# When executed from within Windows command shell, use Windows-style paths
	FIREFOX=c:\Program Files (x86)\Mozilla Firefox\firefox.exe
endif

ifeq (,$(findstring windows,$(shell uname -s)))
	OFFICE=c:/Program\ Files\ \(x86\)/LibreOffice\ 4/program/soffice.exe
else
# When executed from within Windows command shell, use Windows-style paths
	OFFICE=c:\Program Files (x86)\LibreOffice 4\program\soffice.exe
endif

OPTIONS=-w dzslides --template my.dzslides --standalone --include-in-header=header.txt  --include-in-header=css/include.css
#HTMLS := $(patsubst %.md,%.html,talk.md)
MARKDOWN=$(INPUT).md
HTML=$(MARKDOWN:.md=.html)
PDF=$(MARKDOWN:.md=.pdf)

ONSTAGE=shells\onstage.html\#..\$(INPUT).html

PDFOPTIONS=-t beamer --latex-engine=xelatex

ROOT_DIR:=$(shell readlink -f . )

.PHONY: all view

all: $(INPUT).html
	$(shell $(FIREFOX) "file:///$(ROOT_DIR)/$(INPUT).html")

example: example.html
	$(shell $(FIREFOX) "file:///$(ROOT_DIR)/example.html")

view: $(HTML)
	$(shell $(FIREFOX) "file:///$(ROOT_DIR)/$(ONSTAGE)")

%.html: %.md
	pandoc $(OPTIONS) $< -o $@

%.pdf: %.md
	pandoc $(PDFOPTIONS) $< -o $@

pdf:
	pandoc $(PDFOPTIONS) $(MARKDOWN) -o $(PDF)

clean:
	rm -f $(HTML) $(PDF) example.html
