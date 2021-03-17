
awk '
#cap1c - capitalize 1st char in string

BEGIN {
	upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	lower = "abcdefghijklmnopqrstuvwxyz"
}

{
	FIRSTCHAR = substr($1, 1, 1)
	if (CHAR = index(lower, FIRSTCHAR)) {
		$1 = substr(upper, CHAR, 1) substr($1, 2)
	}
	printf("%s\n", $0)
}'


