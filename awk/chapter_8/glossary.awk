
awk '# lookup -- reads local glossary file and prompts user for query

BEGIN { FS ="\t"; OFS = "\t"
	# prompt user
	printf ("Enter a glossary term: ")
} 

# read local file named glossary
FILENAME == "test.glossary"{
		#load each glossary entry into an array
		entry[$1] = $2
		next
} 

# scan for command to exit program
$0 ~ /^(quit|[qQ]|exit|[Xx])$/ { exit }

# process any non-empty line 
$0 != "" {
	foundit = 0
	# loop through items in array
	for ( term in entry ) {
		# compare user input against entry for term 
		if ($0 == term) {
			# if found, print definition
			print entry[term]
			foundit = 1
			# now exit this loop
			break
		}
	}
	# check to see if we never found the term.
	if (foundit == 0) {
		print $0 " not found"
	}
}

# prompt user again for another term
{
printf ("Enter another glossary term (q to quit): ")
}' $1 test.glossary -
