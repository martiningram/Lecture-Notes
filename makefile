MDS=$(wildcard *.md) #This should find all mds in the current folder
HTMLS=$(patsubst %.md,%.html,$(MDS)) #This should produce the corresponding HTML names

.PHONY : all

all : $(HTMLS)

%.html : %.md
	pandoc -f markdown -t html -s $< -o $@

