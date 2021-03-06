awk ' 
# load acronyms file into array "acro"
FILENAME == "acronyms" {
	split($0,entry,"\t")
	acro[entry[1]]=entry[2]
	next
} 
# read any input line containing caps 
$0 ~ /[A-Z][A-Z]+/ {
# loop through acronyms
for ( acronym in acro )
	# compare each field to acronym
	for (i = 1; i <= NF; i++)
		 if ( $i == acronym ) {
			# if it matches, add description 
			 $i = acro[acronym] " (" $i ")"
			 delete acro[acronym] 
			}
}
{
# print all lines
print $0
}' acronyms  $* -
