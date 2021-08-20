.PHONY: all
all: board.pdf

board.pdf: board.tex datasheet.cls deniser-schematic-v1.pdf hw-block.pdf
	pdflatex board.tex
	pdflatex board.tex

clean:
	$(RM) board.pdf
	$(RM) board.aux
	$(RM) board.log
	$(RM) board.out

