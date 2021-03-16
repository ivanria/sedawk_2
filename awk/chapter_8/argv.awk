
awk '
BEGIN{
	for (x = 0; x < ARGC; ++x)
		printf("%s\n", ARGV[x])
	printf("num of arguments is: %d\n", ARGC)
}' "$@"
