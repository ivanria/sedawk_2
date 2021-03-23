
awk '
BEGIN {
	printf("Enter your name: ")
	getline name_var < "-" #read from stdin "-", to variable "name_var"
	# NF, NR, FNR is unchanged, $0 also unchanged, no splitting into $n
	# "name_var = getline" is wrong form
	printf("%s\n", name_var)
}'
