#include <stdio.h>
#include "codam_io.h"

do_test(int argc, char **argv)
{
	char **lines;
	io_all_lines("test.txt", &lines);
	int i = 0;
	while (lines[i] != NULL)
	{
		printf("%s", lines[i]);
		free(lines[i]);
		i += 1;
	}
	return (0);
}
