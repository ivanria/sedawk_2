
awk '
match($0, pattern) {
	printf("%s\n", substr($0, RSTART, RLENGTH));
}' pattern="$1" $2
