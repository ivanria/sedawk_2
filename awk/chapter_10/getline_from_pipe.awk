
awk '
BEGIN {
	i = 1
	while ("who" | getline who_str_arr[i]) {
		if (split(who_str_arr[i], who_arr, "[ 	]+")) {
			who_is[i] = who_arr[1]
		}
		i++
	}
	if (i == 1) {
		printf("who return nothing\n") > "/dev/stderr"
		close("who")
		exit 1
	}
	number_of_who = i
	FS = ":"
	close("who")
}

{
	i = 1
	while (i <= number_of_who) {
		if (who_is[i] ~ $1) {
			printf("%s\n", $5)
		}
		i++
	}
}' /etc/passwd
