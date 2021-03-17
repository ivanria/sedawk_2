#!/bin/bash
[ "$#" -ne 3 ] && >&2  echo "Usage: $0 \"pattern\" \"replacement\" \"file_name\"|\"-\" if stdin in use" && exit 1

awk '

function sed_ampersand_replacement(Str, Pat, Rep,  before, after, amp_pos)
{
	if (match(Rep, /&/)) {
		amp_pos = RSTART
		Rep = substr(Rep, 1, (RSTART - 1)) substr(Rep, (RSTART + RLENGTH))
		if (match(Str, Pat)) {
			before = substr(Str, 1, (RSTART - 1)) substr(Rep, 1, (amp_pos - 1)) substr(Str, RSTART, RLENGTH)
			after = substr(Rep, amp_pos) substr(Str, (RSTART + RLENGTH))
			return before after
		}
	}
}

$0 !~ pattern{
	printf("%s\n", $0)
}

$0 ~ pattern{
	printf("%s\n", sed_ampersand_replacement($0, pattern, replacement))
}' pattern="$1" replacement="$2" "$3" #pattern may be a any regexp, replacement may
# be a string with "&" sign, which will be replaced with the matching pattern
