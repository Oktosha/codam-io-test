#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "test_func.h"

int main(int argc, char **argv)
{
	do_test(argc, argv);
	getchar();
	return (0);
}
