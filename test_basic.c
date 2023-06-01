#include <limits.h>
#include <stdlib.h>
#include <unistd.h>
#include "codam_io.h"

int do_test(int argc, char **argv)
{
	(void) argc;
	(void) argv;
	io_write_string(STDOUT_FILENO, "HEllo!\n");
	io_write_number(STDOUT_FILENO, INT_MAX);
	io_write_char(STDOUT_FILENO, '\n');
	io_write_number(STDOUT_FILENO, INT_MIN);
	io_write_char(STDOUT_FILENO, '\n');
	io_write_number(STDOUT_FILENO, 1000);
	io_write_char(STDOUT_FILENO, '\n');
	io_write_number(STDOUT_FILENO, 999);
	io_write_char(STDOUT_FILENO, '\n');
	io_write_number(STDOUT_FILENO, 0);
	io_write_char(STDOUT_FILENO, '\n');
	io_write_number(STDOUT_FILENO, 5);
	io_write_char(STDOUT_FILENO, '\n');
	io_write_number(STDOUT_FILENO, -3);
	io_write_char(STDOUT_FILENO, '\n');
	io_write_number(STDOUT_FILENO, -42);
	io_write_char(STDOUT_FILENO, '\n');
	io_write_string(STDOUT_FILENO, "");
	io_out("hello %d %s %c\n", 42, "you", 'A');
	io_err("bye %s %d %c\n", "them", -32, 'X');
	t_io_input_file file;
	io_open_for_read("test.txt", &file);
	char *line;
	while (io_next_line(&file, &line) == IO_NEXT_LINE_SUCCESS)
	{
		io_out("%s", line);
		free(line);
	}
	io_close(&file);
	return (0);
}
