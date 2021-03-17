
awk '
#to_lower - change upper case to lower case
BEGIN {
	upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	lower = "abcdefghijklmnopqrstuvwxyz"
}

{
	while (match($0, /[A-Z]+/)) {
		for (x = RSTART; x < (RSTART + RLENGTH); ++x) {
			CAP = substr($0, x, 1)
			CHAR = index(upper, CAP)
			sub(CAP, substr(lower, CHAR, 1), $0)
		}
	}
	printf("%s\n", $0)
}' "$@"
