README=README
INSTALL=VM_INSTALL
SETUP=VM_SETUP

DIR_PDF=PDF
DIR_TEX=TEX

make: pdf tex

pdf: clean-pdf
	pandoc $(README).md  -V geometry:margin=1in -o $(DIR_PDF)/$(README).pdf  --variable urlcolor=RubineRed
	pandoc $(INSTALL).md -V geometry:margin=1in -o $(DIR_PDF)/$(INSTALL).pdf --variable urlcolor=RubineRed
	pandoc $(SETUP).md   -V geometry:margin=1in -o $(DIR_PDF)/$(SETUP).pdf   --variable urlcolor=RubineRed

tex: clean-tex
	pandoc $(README).md  -V geometry:margin=1in -o $(DIR_TEX)/$(README).tex  --variable urlcolor=RubineRed
	pandoc $(INSTALL).md -V geometry:margin=1in -o $(DIR_TEX)/$(INSTALL).tex --variable urlcolor=RubineRed
	pandoc $(SETUP).md   -V geometry:margin=1in -o $(DIR_TEX)/$(SETUP).tex   --variable urlcolor=RubineRed

clean: clean-pdf clean-tex

clean-pdf:
	rm -f $(DIR_PDF)/*.pdf

clean-tex:
	rm -f $(DIR_TEX)/*.tex
