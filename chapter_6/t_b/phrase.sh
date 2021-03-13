#!/bin/bash
# phrase -- search for words across lines
# $1 = search string; remaining args = filenames
search=$1
shift
for file
do
	sed '
	/'"$search"'/b
	N
	h
	s/.*\n//
	/'"$search"'/b
	g
	s/ *\n/ /
	/'"$search"'/{
	g
	b
	}
	g
	D' $file
done

exit 0
