###############################################################################
# Makefile for RHLP docs project
# Created by: Tammy Fox <tfox@redhat.com>
# Last edited by: Tammy Fox <tfox@redhat.com>
# WARNING: need passivetex 1.24 for pdf generation to work
# License: GPL
# Copyright 2003 Tammy Fox, Red Hat, Inc.
###############################################################################

XSLPDF         = ./xsl/main-pdf.xsl
XSLHTML        = ./xsl/main-html.xsl
LANG	       = en
DOCNAME        = suretec-ldap-docs-$(LANG)
XMLFILE        = $(DOCNAME).xml

######################################################
html: 
	@xmlto html -x $(XSLHTML) -o $(DOCNAME) $(XMLFILE)
	@mkdir -p $(DOCNAME)/stylesheet-images
	@cp ./stylesheet-images/*.png $(DOCNAME)/stylesheet-images
	@cp ./css/suretec.css $(DOCNAME)


pdf:
	@xmlto pdf -x $(XSLPDF) $(XMLFILE)

text:
	@xmlto txt $(XMLFILE)

all:
	@./buildall
######################################################

clean: 
	@rm -rfv *.html *.pdf *.tex $(DOCNAME)
