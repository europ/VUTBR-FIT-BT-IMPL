README=README
INSTALL=VM_INSTALL
SETUP=VM_SETUP

DIR_PDF=PDF
DIR_TEX=TEX

make: clean pdf tex

substitute:
	sed -i -re "s/<br>/\ \\\\\n/g" $(README).md

substitute-reset:
	sed -i ':x; $ { N; s/\ \\\n/<br>/; tx }' $(README).md

pdf: clean-pdf
	$(MAKE) substitute
	pandoc $(README).md  -V geometry:margin=1in -o $(DIR_PDF)/$(README).pdf  --variable urlcolor=RubineRed
	pandoc $(INSTALL).md -V geometry:margin=1in -o $(DIR_PDF)/$(INSTALL).pdf --variable urlcolor=RubineRed
	pandoc $(SETUP).md   -V geometry:margin=1in -o $(DIR_PDF)/$(SETUP).pdf   --variable urlcolor=RubineRed
	$(MAKE) substitute-reset

tex: clean-tex
	$(MAKE) substitute
	pandoc $(README).md  -V geometry:margin=1in -o $(DIR_TEX)/$(README).tex  --variable urlcolor=RubineRed
	pandoc $(INSTALL).md -V geometry:margin=1in -o $(DIR_TEX)/$(INSTALL).tex --variable urlcolor=RubineRed
	pandoc $(SETUP).md   -V geometry:margin=1in -o $(DIR_TEX)/$(SETUP).tex   --variable urlcolor=RubineRed
	$(MAKE) substitute-reset

clean: clean-pdf clean-tex

clean-pdf:
	rm -f $(DIR_PDF)/*.pdf

clean-tex:
	rm -f $(DIR_TEX)/*.tex
