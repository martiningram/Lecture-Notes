# NOTE: To make maths expressions work, remove the ` ` markers in markdown.

MDS=$(wildcard *.md) #This should find all mds in the current folder
PDFS=$(patsubst %.md,%.pdf,$(MDS)) #This should produce the corresponding HTML names
PATH_TO_BRISS="C:\Users\marti_000\Downloads\Programmes\briss-0.9\briss-0.9\briss-0.9.exe"

.PHONY : all

all : $(PDFS)

%.pdf : %.md
	pandoc -f markdown -t latex -s $< -o $@
	java -jar $(PATH_TO_BRISS) -s $@
