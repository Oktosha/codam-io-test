#include <stdio.h>
#include <stdlib.h>
#include "codam_io.h"

int do_test(int argc, char **argv)
{
	(void) argc;
	(void) argv;
	t_io_charz data;
	io_read_file("../test.txt", &data);
	for (int i = 0; i < data.len; ++i)
	{
		printf("%c", data.data[i]);
	}
	free(data.data);
	return (0);
}
