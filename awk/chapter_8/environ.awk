
awk '
BEGIN{
	for (env in ENVIRON)
		printf("%s = %s\n", env, ENVIRON[env])
}'
