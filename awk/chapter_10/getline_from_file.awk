
awk '
BEGIN {
	printf("Enter your name: ")
	getline < "-" #get line from stdinput, instead of "-" may be "/path/to/file"
	printf("%s\n", $0)
}'
