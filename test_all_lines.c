#include <stdio.h>
#include <stdlib.h>
#include "codam_io.h"

int do_test(int argc, char **argv)
{
	(void) argc;
	(void) argv;
	char **lines;
	io_all_lines("../test.txt", &lines);
	int i = 0;
	while (lines[i] != NULL)
	{
		printf("%s", lines[i]);
		free(lines[i]);
		i += 1;
	}
	free(lines);
	return (0);
}
