#include "codam_io.h"

int do_test(int argc, char **argv)
{
	(void) argc;
	(void) argv;
	io_assert(io_is_ascii_print(' '), "space is print");
	io_assert(io_is_ascii_print('A'), "A is print");
	io_assert(io_is_ascii_print('~'), "~ is print");
	io_assert(!io_is_ascii_print(-1), "-1 is not print");
	io_assert(!io_is_ascii_print('\n'), "newline is not print");
	io_assert(!io_is_ascii_print(127), "127 is not print");

	io_assert(io_is_ascii_whitespace(' '), "space is whitespace");
	io_assert(io_is_ascii_whitespace('\n'), "newline is whitespace");
	io_assert(!io_is_ascii_whitespace('A'), "a is not whitespace");
	io_assert(!io_is_ascii_whitespace(0), "0 is not whitespace");
	return (0);
}
