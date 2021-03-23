function get_filename(  file)
{
	while (! file) {
		printf("Enter file name: ")
		getline < "-"
		file = $0
		if (system("test -f " file)) {
			printf("file: %s not found\n", file) > "/dev/stderr"
			file = ""
		}
	}
	if (file !~ /^\//) {
		"pwd" | getline
		close("pwd")
		file = $0 "/" file
	}
	return file
}

BEGIN {
	printf("%s\n", get_filename())
}
