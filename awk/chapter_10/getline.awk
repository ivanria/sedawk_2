awk '
/^\.SH "?Name?"/ {
	getline #get next line $0 is replace, NF, NR, FNR are set
	printf("%s\n", $0)
}'
